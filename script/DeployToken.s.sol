// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Script} from "forge-std/Script.sol";
import {Token} from "../src/Token.sol";

contract DeployToken is Script {
    // The supply is 1337 tokens with 18 decimals
    uint256 public constant INITIAL_SUPPLY = 1_337 * 10 ** 18;

    function run() external returns (Token) {
        vm.startBroadcast();
        Token token = new Token(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return token;
    }
}
