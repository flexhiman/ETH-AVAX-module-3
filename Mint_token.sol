// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Importing OpenZeppelin's ERC20 and Ownable contracts compatible with 0.8.19
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable {

    // Constructor that sets the token name, symbol, and mints an initial supply to the deployer
    constructor() ERC20("CustomToken", "CTK") {
        _mint(msg.sender, 1000 * 10 ** decimals());  // Mint 1000 tokens (adjust as needed) to the deployer
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
