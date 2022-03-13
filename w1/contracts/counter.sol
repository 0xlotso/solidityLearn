// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title HelloWorld Contract
 * @notice HelloWorld is greet to denglian
 * @author 0xbountyhunter.eth
 */
pragma solidity ^0.8.0;

contract Counter {
    uint256 public counter;
    // uint[][] 
    event counterChanged(uint256 _to);

    constructor(uint256 _x) {
        counter = _x;
        emit counterChanged(_x);
    }

    function count() public {
        counter = counter + 1;
        emit counterChanged(counter);
    }
}
