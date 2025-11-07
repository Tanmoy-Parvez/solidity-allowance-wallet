# Allowance Wallet (Solidity Practice)

A beginner-friendly Solidity contract that demonstrates how one user can give another user permission to spend from their balance.  
Built to learn how **mapping**, **nested mapping**, **msg.sender**, and **require** work together.

---

## 🎯 Project Goal

To understand how to:

- Store user balances
- Set and manage allowances between users
- Use `msg.sender` to identify who is calling a function
- Apply `require` checks for validation

---

## 🧱 Contract Overview

**Contract Name:** `AllowanceWallet`  
**Solidity Version:** `^0.8.30`

### Variables

| Variable     | Type                                              | Description                                       |
| ------------ | ------------------------------------------------- | ------------------------------------------------- |
| `owner`      | `address`                                         | The address that deployed the contract.           |
| `balances`   | `mapping(address => uint256)`                     | Tracks how much each user owns.                   |
| `allowances` | `mapping(address => mapping(address => uint256))` | Tracks how much one user allows another to spend. |

---

## ⚙️ Functions Overview

#### `deposit(uint256 amount)`

Adds balance to the caller’s own account.

#### `setAllowance(address spender, uint256 amount)`

Lets a user give another address permission to spend up to a certain amount from their balance.  
Includes safety checks:

- Cannot give allowance to self.
- Allowance cannot exceed current balance.

#### `spendFrom(address _owner, uint256 amount)`

Allows a spender to spend part of the owner’s balance, if the owner gave them enough allowance.  
Decreases both:

- The owner’s balance.
- The spender’s remaining allowance.

#### `getBalance()`

Returns the caller’s current balance.

#### `getAllowance(address _owner, address spender)`

Returns how much the `spender` can spend from the `_owner`'s account.

---

## 💡 Example Flow

1. Alice calls `deposit(100)` → Alice’s balance = 100
2. Alice calls `setAllowance(Bob, 40)` → Bob can spend 40 from Alice’s balance
3. Bob calls `spendFrom(Alice, 25)`
   - Alice’s balance = 75
   - Bob’s remaining allowance = 15

---

## 🧪 Tools Used

- [Remix IDE](https://remix.ethereum.org/)
- Solidity `^0.8.30`

---

## 🧠 What I Learned

- How to use nested mappings: `mapping(address => mapping(address => uint256))`
- How `msg.sender` identifies who is calling a function
- Why `require` is used for safety and validation
- Basic contract structure and data flow between users
