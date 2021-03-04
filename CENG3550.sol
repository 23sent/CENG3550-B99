// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

//ERC20 interface from https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol
import "./IERC20.sol";

contract B99 is IERC20 {
    //B99 is only use numbers that are a multiple of 9.
    
    uint private total;     // Total wealth of B99.
    string public name; 
    string public symbol;

    mapping (address => uint256) private balances;
    mapping (address => mapping (address => uint256)) private allowanceMap;
    
    constructor () {
        name = "B99";
        symbol = "NINE";
        total = 999999999;
        balances[msg.sender] = total; // I'm the creator and owner everything. -for now
        
    }

    function totalSupply () public view override returns (uint256) {
        return total; //This value constant, because I can't implement any burn etc function that can change total.
    }
    
    function balanceOf (address account) public view override returns (uint256) {
        return balances[account]; 
    } 
    
    function transfer (address recipient, uint256 amount) public override returns (bool) {
       return transferFrom(msg.sender, recipient, amount);
    }
    
    function allowance (address owner, address spender) public view override returns (uint256) {
        return allowanceMap[owner][spender]; // Who can transfer from your account? And how much.
    }
    
    function approve(address spender, uint256 amount) public override returns (bool) {
        // Only multiples of 9.
        require(isIntProper(amount), "Please give me a reasonable amount.");
        allowanceMap[msg.sender][spender] = amount; // Who can transfer from your account? And how much. Same thing but for set.
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        // Check if balance is enough for transfer.
        // Also, B99 is only use numbers that are a multiple of 9.
        require(isIntProper(amount) && balances[sender] > amount && amount > 0, "Please give me a reasonable transfer amount.");
        if(msg.sender != sender){
            //if it's not your account. Can you use it?
            require(allowanceMap[sender][msg.sender] >= amount, "Allowance falan filan");
            allowanceMap[sender][msg.sender] -= amount;
            //emit Approval(sender, msg.sender, amount);
        }
        
        balances[sender] -= amount;
        balances[recipient] += amount;
        
        emit Transfer(sender, recipient, amount);
        
        return true;
    }
 
    function isIntProper (uint256 value) private pure returns (bool) {
        if (value % 9 == 0) {
            return true;
        }
        return false;
    }
    
}
