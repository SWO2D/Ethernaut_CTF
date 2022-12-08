pragma solidity ^0.8.0;

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password, bytes32 _encryptedPassword) {
    locked = true;
    password = _password;
    password = keccak256(_encryptedPassword);
  }

  function unlock(bytes32 _password, bytes32 _encryptedPassword) public {
    if (password == _password && keccak256(_encryptedPassword) == password) {
      locked = false;
    }
  }
}