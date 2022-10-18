// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MintCoin is ERC20, Ownable {
    constructor() ERC20("MintCoin", "MINTC") {
        _mint(owner(), 1000000000);
    }

    function getMintCoinBalance() external view returns (uint) {
        return balanceOf(owner());
    }


    // Game: GOOD TO GO
    function userGetsHighScore(address addr, uint amount) external onlyOwner {
        // Do other things here
        // And maybe other things here as well
        transfer(addr, amount);
    }
}