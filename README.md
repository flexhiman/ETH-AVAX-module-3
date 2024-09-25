# Create and Mint Token

## Overview

- Here I have imported the ERC20 contract from OpenZeppelin’s repository. The ERC20 contract provides the basic functionality for creating a standard ERC20 token which provides functions like transfer, approve, balanceof, etc.
-  This imports the Ownable contract from OpenZeppelin, which allows certain functions to be restricted to the owner of the contract.
```solidity 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/access/Ownable.sol";
```

- Here I have defined a contract named CustomToken that inherits from ERC20 and Ownable contracts with the functionality of the both.
```solidity
contract CustomToken is ERC20, Ownable {
```

- This constructor runs only once when the contract is deployed.
```solidity
    constructor() ERC20("CustomToken", "CTK") {
```

- This line mints 1000 tokens to the address that deployed the contract which is msg.sender.
```solidity
        _mint(msg.sender, 1000 * 10 ** decimals()); 
    }
```

- This function allows the owner to mint new tokens.
- 'address to' will be the address that will be receiving the minted tokens.
- 'unit256 amount' specifies the amount of tokens you want to mint.
```solidity
    function mintTokens(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
```

- This function allows any user to burn their owntokens.
- The 'unit256 amount' specifies the amount of tokens the user wants to burn.
```solidity
    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
```
