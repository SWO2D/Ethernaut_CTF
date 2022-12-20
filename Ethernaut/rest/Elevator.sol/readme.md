# Challenge Title: Elevator
## Authors

- [@SW02d](https://github.com/SWO2D)
## Goal(s)
* This elevator won't let you reach the top of your building. Right?
The goal of this challenge is to be able to reach the top floor of the building.

## Contract

`Elevator.sol`

## Issue(s)
**Unknown interface implementation** 

Unknown interface implementation, we are not sure about the `Building` interface, as it was not provided, which might be a malicious contract .

```
interface Building {
  function isLastFloor(uint) external returns (bool);
}
```
## Attack scenario(s)

* Attacker can call `goto` and specifies a target floor as an input.


## Solving the challenge
-  in ´King.sol´ Line 7, we can see that the prize is public, which means we can retreive it by:

```
await contract.prize().then(v => v.toString())

//OUTPUT: 1000000000000000
```

In order to become the new king, we need to send more than the prize amount, 2 wei for example or any amount greater than 1000000000000000.

- On remix, we should set the ENVIRONMENT to injected provider - metamask. and deploy the `Attack.sol` contract and providing the contract address which we can get by `await contract.address`

- after deploying the attack contract, we can check the owner again and see that it's changed to our address.

- submit the instance and boom congrats !