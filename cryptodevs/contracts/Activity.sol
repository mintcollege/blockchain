// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//import "Compute.sol";


contract MintActivity is ERC20, ERC20Burnable, Pausable, Ownable {
    uint _perfectScoreCoins;
    uint _maxAwardableCoins;

    constructor() ERC20("Mint Activity", "MAC") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }

    function decimals() public pure override returns (uint8) {
        return 5;
    }

    // Short circuiting
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function awardCoins(address addr, uint amount) external onlyOwner {
        require(amount <= _maxAwardableCoins, "You are awarding too many coins");
//        if(ontime) {
//            amount += 1;
//        }
//        if(perfectScore) {
//            amount + _perfectScoreCoins;
//        }
        transfer(addr, amount);
    }

    function updatePerfectScoreCoins(uint amount) external onlyOwner whenNotPaused returns (uint) {
        _perfectScoreCoins = amount;
        return _perfectScoreCoins;
    }
}