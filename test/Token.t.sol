// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {DeployToken} from "../script/DeployToken.s.sol";
import {Token} from "../src/Token.sol";
import {Test} from "forge-std/Test.sol";

contract TokenTest is Test {
    // The supply is 1337 tokens with 18 decimals
    uint256 public constant INITIAL_SUPPLY = 1_337 * 10 ** 18;
    // Bob starts with 42 tokens
    uint256 public constant BOB_STARTING_AMOUNT = 42 * 10 ** 18;

    Token public token;
    DeployToken public deployer;

    address bob;
    address alice;

    function setUp() public {
        deployer = new DeployToken();

        token = new Token(INITIAL_SUPPLY);
        token.transfer(msg.sender, INITIAL_SUPPLY);

        bob = makeAddr("bob");
        alice = makeAddr("alice");

        vm.prank(msg.sender);
        token.transfer(bob, BOB_STARTING_AMOUNT);
    }

    function testInitialSupply() public view {
        assertEq(token.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testName() public view {
        assertEq(token.name(), "Token");
    }

    function testSymbol() public view {
        assertEq(token.symbol(), "TKN");
    }

    function testDecimals() public view {
        assertEq(token.decimals(), 18);
    }

    function testBalanceOf() public view {
        assertEq(token.balanceOf(bob), BOB_STARTING_AMOUNT);
        assertEq(token.balanceOf(alice), 0);
    }
}
