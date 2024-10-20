// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Owner {
   address public owner;
   constructor () {
    owner = msg.sender;
   }
    function showOwner() public view returns (address) {
      require(msg.sender == owner); 
    }
}