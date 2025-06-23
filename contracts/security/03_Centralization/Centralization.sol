// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Centralization is ERC20, Ownable {
    // 把这个地址设为常量，方便复用／审计
    address public constant exposedAccount =
        0xe16C1623c1AA7D919cd2241d8b36d9E79C1Be2A2;

    // 先给 ERC20 传 name/symbol，再给 Ownable 传初始 owner
    constructor()
        ERC20("Centralization", "Cent")
        Ownable(exposedAccount)
    {
        // constructor 体可以留空，owner 已由 Ownable(exposedAccount) 直接设定
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}