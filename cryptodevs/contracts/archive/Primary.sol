// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


import './Messaging.sol';


contract Primary is Messaging {
    constructor(string memory abc, uint age) Messaging(abc, age) {}
}