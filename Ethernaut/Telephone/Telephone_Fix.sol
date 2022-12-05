// This fix checks that the transaction origin address matches the `msg.sender` address 
// before allowing the function to be executed.

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Telephone {
  address public owner;

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(tx.origin == msg.sender);
    _;
  }

  function changeOwner(address _owner) public onlyOwner {
    owner = _owner;
  }
}
