# Challenge Title: King
## Authors

- [@SW02d](https://github.com/SWO2D)
## Goal(s)
* The contract represents a very simple game: whoever sends it an amount of ether that is larger than the current prize becomes the new king. On such an event, the overthrown king gets paid the new prize, making a bit of ether in the process! As ponzi as it gets xD

Such a fun game. Your goal is to break it.

## Contract

`King.sol`

## Issue(s)

* The contract allows anyone to send it an amount of ether that is larger than the current prize and become the new king


```
receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }
```
## Attack scenario(s)

* Attacker can send a large enough amount of ether to the contract and become the king. and then in the attack contract, they can set a fallback fucntion that reverts when the instance contract tries to reclaim ownership.

## Recommendation
To fix the issue, we can modify the receive function to require that msg.value is greater than the current prize.
### Code fix

```
require(msg.value > prize || msg.sender == owner
```

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