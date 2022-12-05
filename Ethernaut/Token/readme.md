
# Challenge Title: Token

## Goal(s)
*  You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens.

## Contract

`Token.sol`

## Issues

* Integer underflow:

Integer underflow in Solidity is a type of attack that occurs when an integer value is subtracted below 0, resulting in unexpected and potentially malicious behavior. This kind of attack can be used to execute malicious functions, drain funds, or even create infinite values out of thin air. Such attacks can be prevented by adding additional checks to the code when subtracting integers.

```
function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

```

## Attack scenario(s)


* Attacker can simply transfer 21 tokens (which is more than 20) to make the above condition true.

`require(balances[msg.sender] - _value >= 0);`
`Balance = 20 | Value = 21 ==> 20 - 21` 

This will make the value to underflow and return a huge number like this: '115792089237316195423570985008687907853269984665640564039457584007913129639935'.

## Recommendation

In order to prevent integer underflow in Solidity, it is recommended to perform additional checks when dealing with integers, such as ensuring that subtractions don't decrease a value to below 0. It is also advisable to add functions that check for overflows as well as underflows. Finally, where possible, use the safe math library provided by OpenZeppelin to ensure that integer operations do not result in unexpected behavior.

### Code fix

`Token_Fix.sol`

## Solving the challenge
* We can check that we are given 20 tokens to start with by running the following command 

`await contract.balanceOf(player)`
it should return 20.

* Now we can Initiate a transfer to an address as the target and '21' as value. we can simply transfer the value to the 0 Address.

* This will cause the underflow and now we can check out balance again. 

`await contract.balanceOf(player)`

* The player now has a huge number of Tokens.


