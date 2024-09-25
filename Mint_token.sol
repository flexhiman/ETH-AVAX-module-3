// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable {

    constructor() ERC20("CustomToken", "CTK") {
        _mint(msg.sender, 1000 * 10 ** decimals());  
    }

    // Only the contract owner can mint new tokens to a given address
    function mintTokens(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Any user can burn their own tokens
    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
