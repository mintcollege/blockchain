// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract Hello {
    // State variables cost crypto
    string message = 'Hello there';     // You pay for this
    uint age = 456;                     // You pay for this
    uint score = 9897;                  // You pay for this
    uint a = 3454;
    uint b = 42354235;
    uint c = 5654;

    function getMessage() public pure returns (string memory) {
        string memory otherMessage = 'Hoho';    // Free
        return otherMessage;
    }

    function getAge() public pure returns (uint) {
        uint userAge = 23;
        return userAge;
    }
}