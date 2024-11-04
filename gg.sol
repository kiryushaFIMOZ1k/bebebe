// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserManagement {
    struct User {
        string name;
        uint age;
        uint balance;
    }
    mapping (address => User) private users;
    constructor() {
    }
    modifier onlyExistingUser() {
require(bytes(users[msg.sender].name).length != 0, "User does not exist.");
        _;
    }
    function  addUser(string memory _name, uint _age) public {
    require(bytes(users[msg.sender].name).length == 0, "User already exists.");
        
        users[msg.sender] = User({
            name: _name,
            age: _age,
            balance: 0
        });
    }
    function updateUser(string memory _name, uint _age, uint _balance) public onlyExistingUser {
    }
    function getUser() public view onlyExistingUser returns(string memory, uint, uint) {
        User memory user = users[msg.sender];
        return (user.name, user.age, user.balance);
    }
}
