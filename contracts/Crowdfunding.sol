// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crowdfunding {
    address public owner;
    uint256 public goal;
    uint256 public raisedAmount;

    constructor(uint256 _goal) {
        owner = msg.sender;
        goal = _goal;
    }

    // Function 1: Contribute to the campaign
    function contribute() external payable {
        require(msg.value > 0, "Contribution must be greater than 0");
        raisedAmount += msg.value;
    }

    // Function 2: Withdraw funds if goal reached
    function withdraw() external {
        require(msg.sender == owner, "Only owner can withdraw");
        require(raisedAmount >= goal, "Funding goal not reached");
        payable(owner).transfer(address(this).balance);
    }

    // Function 3: Get current status
    function getStatus() external view returns (uint256 goalAmount, uint256 totalRaised) {
        return (goal, raisedAmount);
    }
}
