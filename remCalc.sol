// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract remCalc {
    function remainder(uint _a,uint _b) public pure returns (uint) {
        require(_b != 0);
        return _a % _b;
    }
}