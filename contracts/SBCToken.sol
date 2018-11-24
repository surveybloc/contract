pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol';
import 'openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol';
import './Blacklist.sol';

contract SBCToken is ERC20Detailed, ERC20Burnable, Blacklist {


    uint256 public constant INITIAL_SUPPLY = 100000000000 * (10 ** uint256(decimals()));

    constructor() public ERC20Detailed("SBCToken", "SBC", 18) {
        _mint(msg.sender, INITIAL_SUPPLY);
  }
}
