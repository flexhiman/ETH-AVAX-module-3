// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyCustomToken {

    // Public variables to store token details
    string public tokenName = "CustomToken";
    string public tokenAbbreviation = "CTK";
    uint public totalSupply = 0;
    address public owner;

    // Mapping to store balances of addresses
    mapping(address => uint) public balances;

    // Constructor to initialize the owner as the contract deployer
    constructor() {
        owner = msg.sender;
    }

    // Function to mint tokens, can only be called by the owner
    function mint(address _to, uint _amount) public {
        require(msg.sender == owner, "Only the owner can mint tokens.");
        totalSupply += _amount;
        balances[_to] += _amount;
    }

    // Transfer function to send tokens to another address
    function transfer(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance.");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

    // Burn function to allow users to destroy their own tokens
    function burn(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance to burn.");
        totalSupply -= _amount;
        balances[msg.sender] -= _amount;
    }
}
