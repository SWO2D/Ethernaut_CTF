![BigLevel2](https://user-images.githubusercontent.com/61026156/205658045-4c27bb2b-1c66-4056-92df-7050651b80f2.svg)

# Challenge Title: FAL1OUT

## Goal(s)
* Claim ownership of the contract below to complete this level.

## Contract

`Fal1out.sol`

## Issues
### Issue 1
* Owner takeover:
In line 13, The comment indicates that the below code is expected to be a Constructor, The Constructor keyword wasn't used but it was called as a public function instead which anybody can call.

```
/* constructor */
  function Fal1out() public payable {
    owner = msg.sender;
    allocations[owner] = msg.value;
  }
```
### Issue 2
* Attacker can drain all contract's fund:
After the attacker gains the contract's ownership, they can call the `collectAllocations` function and take all the funds from the contract since there's no restriction on the amout that can be transfered.

```
function collectAllocations() public onlyOwner {
    msg.sender.transfer(address(this).balance);
  }
```


## Attack scenario(s)


* Attacker can simply call the `Fal1out` function and they will take ownership of the contract.

## Recommendation

Use the onlyOwner modifier to prevent any other user to be the new owner.

### Code fix

```
 /* constructor */
  function Fal1out() public payable onlyOwner{
    owner = msg.sender;
    allocations[owner] = msg.value;
  }
```

## Solving the challenge

By interacting with the Vulnerable contract through the console, you can call `contract.Fal1out()` to take ownership. you can verify this by `await contract.owner() == player` and it'll return `true`.
