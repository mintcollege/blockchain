//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Gas fee: 559294


contract Shows {
    address owner;
    string anime = "One Punch Man";
    string movie;
    uint age;
    address doctor;

    error InvalidAge();   // Only works with revert not require

    constructor(string memory _movie, uint _age, address _doctor) {
        owner = msg.sender;
        movie = _movie;
        age = _age;
        doctor = _doctor;
    }

    /* VERY VERY SENSITIVE FUNCTION HERE */
    function changeOwner(address newowner) public onlyOwner {
        owner = newowner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    modifier onlyAge() {
        // require(age == 39, "You are not the right age");
        if(age != 39) {
            revert InvalidAge();
        }
        _;
    }

    modifier onlyDoctor() {
        require(msg.sender == doctor, "You are not my doctor");
        _;
    }

    function getAnime() public view onlyOwner returns (string memory) {
        return anime;
    }

    function setAnime(string memory _anime) public onlyOwner onlyAge {
        // require(age == 39, "You are not the right age");
        // if (msg.sender != owner) {
        //     revert("You are not the owner");
        // }
        anime = _anime;
    }

    function getMovie() public view onlyOwner returns (string memory) {
        return movie;
    }

    function getMedicalData() public view onlyDoctor returns (uint) {
        return 789;
    }

    function setDoctor(address newdoctor) public onlyOwner {
        doctor = newdoctor;
    }
}