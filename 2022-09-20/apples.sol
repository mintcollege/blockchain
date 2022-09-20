// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;


contract Apples {
    struct User {
        uint id;
        uint funds;
        bool blocked;
        string username;
        uint highest;
        uint lowest;
    }
    mapping(address => User) public users;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyUnblocked {
        require(users[msg.sender].blocked == true, 'That is bad and you should feel bad.');
        _;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You are not the owner");
        require(users[msg.sender].blocked == true, 'That is bad and you should feel bad.');
        _;
    }

    function updateBlockStatus(address addr, bool status) public onlyOwner {
        User memory user = users[addr];
        user.blocked = status;
        users[addr] = user;
    }

}