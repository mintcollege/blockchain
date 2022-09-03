// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;



contract Foo {
    function getGameName() public pure returns (string memory) {
        string memory game = 'Valorant';
        return game;
    }

    function getTokenName() public pure returns (string memory) {
        string memory name = 'ETH';
        return name;
    }

    function getHiScore() public pure returns (uint) {
        uint score = 1234;
        return score;
    }

    function isPaid() public pure returns (bool) {
        bool userIsPaid = true;
        return userIsPaid;
    }
}

contract Bar {}
