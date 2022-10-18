// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import 'hardhat/console.sol';


contract ExpenseTracker {
    struct User {
        uint id;
        address addr;
        uint total;
        uint count;
        bool isBanned;
    }

    struct Expense {
        address user;
        uint amount;
    }

    address public owner;
    uint public idCounter;
    uint public expenseCounter;
    mapping(address => User) public users;
    mapping(uint => Expense) public expenses;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You cannot do that.");
        _;
    }

    modifier notBanned {
        require(users[msg.sender].isBanned == false, "You cannot do this if you are banned");
        _;
    }

    function addUser(address addr) public onlyOwner {
//        require(users[addr].id == 0, "User already exists");
        idCounter++;
        users[addr] = User(idCounter, addr, 0, 0, false);
    }

    function addExpense(address addr, uint _amount) external notBanned {
        console.log('hello');
        expenseCounter++;
        expenses[expenseCounter] = Expense(addr, _amount);
    }

    function banUser(address addr) external {
        User memory user = users[addr];
        user.isBanned = true;
        users[addr] = user;
    }

    function unbanUser(address addr) external {
        User memory user = users[addr];
        user.isBanned = false;
        users[addr] = user;
    }


}