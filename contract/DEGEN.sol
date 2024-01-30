// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DEGEN is ERC20, Ownable {

    mapping(address => string[]) _purchases;
    string[] public items = ["cap", "t-shirt", "socks"];

    constructor() ERC20("DEGEN", "DGN") Ownable(msg.sender) {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    // Mint new tokens, only callable by the owner
    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }

    // Transfer tokens from the sender to a recipient
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    // Redeem tokens for items in the in-game store
    function redeem(uint256 id) external {
        require(id < 3, "Item does not exist");
        require(balanceOf(_msgSender()) >= 50, "Insufficient balance");
        _burn(_msgSender(), 50);
        _purchases[_msgSender()].push(items[id]);
    }

    // Check token balance of an address
    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    // Burn tokens, anyone can burn their own tokens
    function burn(uint256 amount) external {
        _burn(_msgSender(), amount);
    }
}
