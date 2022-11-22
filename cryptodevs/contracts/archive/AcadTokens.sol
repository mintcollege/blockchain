// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract AcadTokens is ERC20, Pausable, ERC20Burnable, Ownable {
    uint constant AWARD_TOKENS = 7500;
    uint constant FULL_SEM = 40000;
    uint constant FULL_YEAR = 100000;
    string constant public AWARD_NAME = 'MOST TOKENS AWARD';

    mapping(address => bool) public students;
    address public mostTokensAddress;
    uint public mostTokensAmount;

    constructor() ERC20("AcadTokens", "ACAD") {
        _mint(msg.sender, 10000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // TESTME: Untested
    function _beforeTokenTransfer(address from, address to, uint256 amount)
    internal whenNotPaused override {
        require(balanceOf(from) > 20000, "You cannot transfer unless you have at least 2 tokens.");
        super._beforeTokenTransfer(from, to, amount);
    }

    // TESTME: Untested
    function addStudent(address addr) external onlyOwner{
        students[addr] = true;
    }

    // TESTME: Untested
    function awardTokensFullYear(address addr) external onlyOwner returns (bool) {
        return transfer(addr, FULL_YEAR);
    }

    // TESTME: Untested
    function awardTokensFullSem(address addr) external onlyOwner returns (bool) {
        return transfer(addr, FULL_SEM);
    }

    // TESTME: Untested
    function awardTokensFinals(address addr) external onlyOwner returns (bool) {
        return transfer(addr, AWARD_TOKENS);
    }

    function decimals() public pure override returns (uint8) {
        return 4;
    }

    // TESTME: Untested
    function transfer(address to, uint256 amount) public override onlyOwner returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        if(amount > mostTokensAmount) {
            mostTokensAddress = to;
        }
        return true;
    }

    // TESTME: Untested
    function getWinner() external view returns (address) {
        return mostTokensAddress;
    }

    // TESTME: Untested
    function useTokenTeExtend() external {
        require(students[_msgSender()] == true, "You are not a student.");
        require(balanceOf(_msgSender()) > 10000, "You do not have enough funds to complete this.");
        burn(10000);
    }
}