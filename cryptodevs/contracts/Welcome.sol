// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract Welcome {
    string message;

    constructor() {
        message = 'Welcome to my contract!';
    }

    function getMessage() external view returns (string memory) {
        return message;
    }

    function welcomeMessage() external pure returns (string memory) {
        return 'I welcome you the the Dapp world';
    }

    function setMessage(string memory _message) external {
        message = _message;
    }
}
