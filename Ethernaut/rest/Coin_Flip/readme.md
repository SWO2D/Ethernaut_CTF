# Challenge Title: Coin Flip
## Authors

- [@SW02d](https://github.com/SWO2D)
## Goal(s)
* This is a coin flipping game where you need to build up your winning streak by guessing the outcome of a coin flip. To complete this level you'll need to use your psychic abilities to guess the correct outcome 10 times in a row.

## Contract

`CoinFlip.sol`

## Issue(s)

* The contract is relying on block.number as a form of randomness.

```
uint256 blockValue = uint256(blockhash(block.number - 1));
```
## Attack scenario(s)

* Attacker can always calculate the correct answer if they run the same algorithm in their attack function before calling the flip function

## Recommendation
Never depend on block.number as a form of randomness.
### Code fix

[to add]

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