# Challenge Title: Telephone
## Authors

- [@SW02d](https://github.com/SWO2D)
## Goal(s)
* Claim ownership of the contract below to complete this level.

## Contract

`Telephone.sol`

## Issue(s)

* Using `tx.Origin` to verify ownership:

This vulnerability allows the user to send transactions from an unknown or untrusted address and potentially gain unintended access to functions or data stored in the smart contract.


```
function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
```
## Attack scenario(s)

* Attacker can exploit the `tx.origin` vulnerability to call the `changeOwner` function and set the owner address to their own address instead.

## Recommendation

In order to prevent this type of exploit, it is recommended that developers use a modifier in their contracts that checks the transaction origin address before allowing certain functions to be executed.

### Code fix

`Telephone_Fix.sol`

## Solving the challenge
- First, we should check the current contract owner by using this command in the console: `await contract.owner()`
![](https://i.imgur.com/jXwSC46.png)

- now that we know the current owner, we should deploy the attack contract on Remix using injected provider to use Metamask.
![](https://i.imgur.com/d7Bi4Kc.png)

- After we successfully connect Metamask and Remix, it's time now to deploy the Attack contract using the Telephone contract Address as input in the Deploy field. we can get the address using the following command: `await contract.address`
![](https://i.imgur.com/IED6JRa.png)

- now we can go to Metamask and and copy our Address, feed it to `changeOwner` and validate the transaction.
![](https://i.imgur.com/Ub3rXL8.png)

- By entering `await contract.owner` again, we can see that our Address is the new owner of the contract.


![](https://i.imgur.com/FWd4Hd5.png)
