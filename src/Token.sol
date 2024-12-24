// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title Token contract
/// @author Stefan Alfbo
/// @notice A simple ERC20 token contract that keeps track of fungible tokens: any
///         one token is exactly equal to any other token; not tokens have special
///         rights or attributes.
/// @dev This contract is based on the OpenZeppelin ERC20 contract.
contract Token is ERC20 {
    /// @notice Construct a new Token contract
    /// @param initialSupply The initial supply of tokens to mint to the deployer
    constructor(uint256 initialSupply) ERC20("Token", "TKN") {
        _mint(msg.sender, initialSupply);
    }
}
