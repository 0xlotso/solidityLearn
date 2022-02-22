// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title HelloWorld Contract
 * @notice HelloWorld is greet to denglian
 * @author 0xbountyhunter.eth
 */
contract HelloWorld{
    event print(string str);

    constructor(){}

    /**
     * @notice Greet to web3
     */
    function greet()public{
        emit print("Hello Denglian!");
    }


    /**
     * @notice receive base token
     */
    receive()external payable{}

}
