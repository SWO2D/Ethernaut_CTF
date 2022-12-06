# Challenge Title: Delegation

## Goal(s)
* Claim ownership of the contract below to complete this level.

## Contract

`Delegation.sol`

## Issues
* Ownership takeover:

The fallback function allows arbitrary code execution by delegating the call to the Delegate contract, without any checks on who the caller is or what the data contains. This means that an attacker could call the pwn() function in the Delegate contract and take control of the contract
```
fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
```

## Attack scenario(s)

* An attacker could call the Delegation contract’s fallback function with data that contains a call to the pwn() function in the Delegate contract. The pwn() function would then set the owner of the Delegate contract to the attacker’s address, giving them control of the Delegate contract. The attacker then has access to all the resources owned by the Delegate contract. 

## Recommendation

Add a check to the Delegation contract’s fallback function to make sure that the caller is authorized to call the delegate.

### Code fix

[To be adde later]

## Solving the challenge
* First, We ca check the curent contract owner.
`Await contract.owner()`

* After we check the current owner, we can focus on the function `pwn()` which does the change ownership logic. on the console, we can hash the fuunction because we'll need it the hash in the next step.
`var attack = web3.utils.keccak256("pwn()")`
This will give us the hash of the function.
* Finally, we can now send a transaction to the contract.
`contract.sendTransaction({data: attack})`
This will trigger the fallback function and change the current owner to the new owner. Challenge solved !