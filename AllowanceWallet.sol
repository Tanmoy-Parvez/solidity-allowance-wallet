// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract AllowanceWallet {

    address public owner;
    mapping(address => uint256) public balances;
    // allowances[owner][spender] = amount
    mapping(address => mapping(address => uint256)) public allowances;

    constructor() {
        owner = msg.sender;
    }

    // deposit adds balance to the caller's own account
    function deposit(uint256 amount) public {
        balances[msg.sender] += amount;
    }

    // allow someone else to spend from your balance (up to a limit)
    function setAllowance(address spender, uint256 amount) public {
        require(spender != msg.sender, "You cannot allow yourself.");
        require(amount <= balances[msg.sender], "Allowance exceeds your balance.");
        allowances[msg.sender][spender] = amount;
    }

    // spend balance from another user's account
    // caller must have been given allowance by that user
    function spendFrom(address _owner, uint256 amount) public {
        require(balances[_owner] >= amount, "Owner does not have enough balance.");
        require(allowances[_owner][msg.sender] >= amount, "Not enough allowance.");
        
        balances[_owner] -= amount;
        allowances[_owner][msg.sender] -= amount;
    }

    // returns the caller's current balance
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // returns how much 'spender' is allowed to spend from '_owner' account
    function getAllowance(address _owner, address spender) public view returns (uint256) {
        return allowances[_owner][spender];
    }
}
