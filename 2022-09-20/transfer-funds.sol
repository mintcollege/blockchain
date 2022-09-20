// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;


contract FundMe {
    address public owner;
    mapping(address => uint) public userfunds;

    // Put funds inside the contract
    constructor() payable {
        owner = msg.sender;
    }

    // Check how much funds a contract has
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    modifier onlyOwner {
        require(msg.sender == owner, 'You shall not pass!');
        _;
    }

    modifier validAddress(address addr) {
        require(addr != address(0), 'Address is not valid');
        _;
    }

    // contract -> user/contract
    function transferFunds(address payable recipient, uint amount) external onlyOwner validAddress(recipient) {
        require(getBalance() > amount, 'You do not have enough funds');
        userfunds[recipient] += amount;
        recipient.transfer(amount);     // Last always
    }

    // user/contract -> contract
    function recieveFunds() public {}
}