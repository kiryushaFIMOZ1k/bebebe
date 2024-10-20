// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Map {
    mapping(uint =>address) public addresses;
    function addAdr(uint _addAdrNumber) public {
    addresses[_addAdrNumber] = msg.sender;
   }
}