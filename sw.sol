// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    struct User {
        address userAddress;
        string name;
    }

    User[] public users;
    mapping(address => uint256) private balances;

    event UserAdded(address indexed userAddress, string name);
    event Deposited(address indexed userAddress, uint256 amount);
    event Withdrawn(address indexed userAddress, uint256 amount);

    function addUser(string memory _name) public {
        require(!isUserExists(msg.sender), "User already exists");
        
        users.push(User({
            userAddress: msg.sender,
            name: _name
        }));
        
        emit UserAdded(msg.sender, _name);
    }

    function isUserExists(address _userAddress) internal view returns (bool) {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i].userAddress == _userAddress) {
                return true;
            }
        }
        return false;
    }

    function deposit() public payable {
        require(isUserExists(msg.sender), "User does not exist");
        require(msg.value > 0, "Deposit amount must be greater than zero");

        balances[msg.sender] += msg.value;

        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) public {
        require(isUserExists(msg.sender), "User does not exist");
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);

        emit Withdrawn(msg.sender, _amount);
    }

    function getBalance() public view returns (uint256) {
        require(isUserExists(msg.sender), "User does not exist");
        return balances[msg.sender];
    }
}
