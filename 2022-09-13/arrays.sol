// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract Foo {
    // struct User {
    //     string name;        // ''
    //     uint age;           // 0
    //     address addy;       // 0x000000000000000000000000000000000000
    // }

    // // address[] public addys = [0x0000000000000000000000000000000000000000];
    // // string[] public names = ['Jeff', 'Mark', ''];
    uint[] public scores = [2, 4, 6, 8];
    // User[] public users = [User('Sam', 123, 0xeF0efE32B2f02BB7291F2958dE97d92E4BB26462)];

    // function addUScore(uint _score) public {
    //     scores.push(_score);
    // }

    // function getLastItem() public view returns (User memory) {
    //     return users[users.length - 1];
    // }

    // function deleteItem() public {
    //     // delete scores[idx];
    //     scores.pop();
    // }

    // function getLength() public view returns (uint) {
    //     return scores.length;
    // }

    // // [2, 4, 6, 8];
    // function deleteByIdx(uint idx) public {
    //     for (uint i = idx; i < scores.length - 1; i++) {
    //         scores[i] = scores[i + 1];
    //     }
    //     scores.pop();
    // }

    function localArrayOfInts() public pure returns (uint[] memory) {
        // Fixed array: no push(), pop()
        uint[] memory numbers = new uint[](5);
        numbers[0] = 27;
        numbers[1] = 45;
        numbers[4] = 12;
        delete numbers[4];
        return numbers;
    }

    // [2, 4, 100, 8];
    function loopScores() external {
        uint len = scores.length;
        for (uint i; i < len; i++) {
            // Do what you want with each element
        }

        uint[] memory arr = scores;
        arr[2] = 100;
        arr[0] = 934;
        scores = arr;
    }


    // Etherium (EVM) => ETH     10,000Php
    // Polygon (EVM) => MATIC    10Php
}
