# Create and mint Token

## Overview 
- Here I have created a new smart contract named as MyCustomToken
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyCustomToken {
```

- Here I have declared public variables takenName, tokenAbbreviation, totalSupply of type String and initialized it with the value "CustomToken", "CTK", "0".  
``` solidity
    string public tokenName = "CustomToken";
    string public tokenAbbreviation = "CTK";
    uint public totalSupply = 0;
    address public owner;
```

- This line defines a public mapping balances that maps an address to a uint. It stores the balance of tokens for each address.
```solidity
    mapping(address => uint) public balances;
```

- I have created a constructor and set the owner variable to msg.sender.
```solidity
    constructor() {
        owner = msg.sender;
    }
```

- I have created a function mint to mint new tokens. The 'require' statement checks if the caller of the function is the owner of the function or not. 
```solidity
    function mint(address _to, uint _amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens.");
        totalSupply += _amount;
        balances[_to] += _amount;
    }
```

- The transfer function transfers the tokens from sender to receiver. And 'require' statement checks if the caller of the function is the owner or not.
```solidity
    function transfer(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance.");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
```

The burn function is to burn the tokens. And the 'require' statement checks if the caller of the function is the owner or not.
```solidity
    function burn(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance to burn.");
        totalSupply -= _amount;
        balances[msg.sender] -= _amount;
    }
}
