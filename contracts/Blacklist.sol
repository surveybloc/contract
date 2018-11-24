pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC20/ERC20Pausable.sol';
import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract Blacklist is ERC20Pausable, Ownable {

	mapping(address => bool) private blackListAccounts;
	
	function addblacklist(address addr)
		public
		onlyOwner
	{
		blackListAccounts[addr] = true;
		emit AddBlacklisted(addr);
	}

	function deleteFromBlacklist(address addr)
		public
		onlyOwner
	{
		blackListAccounts[addr] = false;
		emit DeleteFromBlacklisted(addr);
	}
	
	function transfer(address to, uint256 value)
		public 
		returns (bool)
	{
		require(!blackListAccounts[to]);
		return super.transfer(to, value);
	}
	
	function transferFrom(address from, address to, uint256 value)
		public 
		returns (bool)
	{
		require(!blackListAccounts[from]);
		require(!blackListAccounts[to]);
		return super.transferFrom(from, to, value);
	}

	
	
	function approve(address spender, uint256 value)
		public
		returns (bool)
	{
		require(!blackListAccounts[spender]);
		return super.approve(spender, value);
	}
	
	function increaseAllowance(address spender, uint addedValue)
		public
		returns (bool success)
    {
		require(!blackListAccounts[spender]);
		return super.increaseAllowance(spender, addedValue);
    }
	
	function decreaseAllowance(address spender, uint subtractedValue)
		public
		returns (bool success)
    {
		require(!blackListAccounts[spender]);
		return super.decreaseAllowance(spender, subtractedValue);
    }	
	

	event AddBlacklisted(address indexed target);
	event DeleteFromBlacklisted(address indexed target);	
}