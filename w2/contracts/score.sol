// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @title Score Contract
 * @notice Store score of students
 * @author 0xbountyhunter.eth
 */
pragma solidity ^0.8.0;

contract Score {
    address owner;
    address teacher;
    enum Subject {
        CHINESE,
        MATH,
        ENGLISH
    }

    mapping(address => mapping(Subject => uint256)) scores;

    modifier onlyTeacher() {
        require(msg.sender == teacher, "only teacher allowed");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setTeacher(address _addr) external {
        require(msg.sender == owner);
        teacher = _addr;
    }

    function changeScore(
        address _stu,
        Subject _subject,
        uint256 _score
    ) external {
        require(_score <= 100 && _score >= 0, "score invalid");
        scores[_stu][_subject] = _score;
    }
}
