// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title Bank Contract
 * @notice Supply and Withdraw
 * @author 0xbountyhunter.eth
 */
pragma solidity ^0.8.0;

contract Counter {
    address owner;

    mapping(address => uint256) supply;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner");
        _;
    }

    receive() external payable {
        supply[msg.sender] += msg.value;
    }

    function withdraw() external {
        supply[msg.sender] = 0;
        // todo contract address may be failed.
        payable(msg.sender).transfer(supply[msg.sender]);
    }
}
