// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Message {
    uint public targetAmount = 123;
    uint public totalFunds;

    function helloMessage() external onlyOwner pure returns (string memory) {
        // Complex with other logic
        return 'Hello there!';
    }

    function expectFunds(uint _amount) external view returns (bool) {
        // Amount should be a specific number
        return targetAmount == _amount;
    }
}