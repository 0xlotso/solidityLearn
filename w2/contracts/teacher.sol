// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title Teacher Contract
 * @notice change the score of student
 * @author 0xbountyhunter.eth
 */
pragma solidity ^0.8.0;

interface score {
    function changeScore(
        address _stu,
        uint256 _subject,
        uint256 _score
    ) external;
}

contract Teacher {
    address owner;
    address scoreAddr;
    mapping(address => bool) whitelist;

    constructor(address _score) {
        owner = msg.sender;
        scoreAddr = _score;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "only onwer");
        _;
    }

    function addWhitelist(address _addr) external onlyOwner {
        whitelist[_addr] = true;
    }

    function rmWhitelist(address _addr) external onlyOwner {
        delete whitelist[_addr];
    }

    function changeScore(
        address _addr,
        uint256 _subject,
        uint256 _score
    ) external {
        score ins = score(scoreAddr);
        ins.changeScore(_addr, _subject, _score);
    }
}
