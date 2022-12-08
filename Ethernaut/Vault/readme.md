# Challenge Title: Vault

## Goal(s)
* Unlock the vault to complete this level.

## Contract

`Vault.sol`

## Issues
* insecure password state variable initialization:

The issue in this contract is that the constructor assigns the instance's "password" state variable. This means that anyone who can access the source code can also access the password, and that the password is not kept secure
```
contract Vault {
  bool public locked;
  bytes32 private password;
```

## Attack scenario(s)

* The attacker can retrieve the password from the state variable by using a debugger or decompiler. These tools allow the attacker to read the memory of the Ethereum Virtual Machine (EVM) and access the password stored in the Vault contract's state variable.

## Recommendation

Never store sensitive data like passwords in storage as blockchain is public and decentralized. which means everybody will be able to see that data.

### Code fix

``Vault_fix.sol``

## Solving the challenge
* First, we need the contract's address: `contract.address`
* We can retrieve the password from the contract storage: `web3.utils.getStorage('[contract's address]', 1)`
`1`is the index of the slot where the password is stored. for more in depth details about Storage in solidity, check out this resource.
https://mixbytes.io/blog/collisions-solidity-storage-layouts#:~:text=Solidity%20does%20not%20possess%20a,and%20unpacked%20on%20the%20fly.

* Now, we should have a Hash which we can pass to the unlock function: `contract.unlock('[hash]')`

* Submit the instance and now you passed the challenge !
