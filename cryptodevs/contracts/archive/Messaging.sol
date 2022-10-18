// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;



contract Messaging {
    address public owner;   // owner()
    string public message;  // message()
    uint public age;        // age()

    constructor(string memory _message, uint _age) {
        owner = msg.sender;
        setMessage(_message);
        setAge(_age);
    }

//    function getMessage() public view returns (string memory) {
//        return message;
//    }

    function setMessage(string memory _message) public {
        message = _message;
    }

    function setAge(uint _age) public {
        age = _age;
    }

//    function getAge() external view returns (uint) {
//        return age;
//    }
}