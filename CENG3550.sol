pragma solidity ^0.8.0;

//ERC20 interface from https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol
import "./IERC20.sol";

contract B99 is IERC20 {
    
    uint private total;
    string public name;
    string public symbol;

    mapping (address => uint256) private balances;
    mapping (address => mapping (address => uint256)) private allowanceMap;
    
    constructor () {
        name = "B99";
        symbol = "NINE";
        total = 999999999;
        balances[msg.sender] = total;
        
    }
    
    function totalSupply () public view override returns (uint256) {
        return total;
    }
    
    function balanceOf (address account) public view override returns (uint256) {
        return balances[account];  
    } 
    
    function transfer (address recipient, uint256 amount) public override returns (bool) {
       return transferFrom(msg.sender, recipient, amount);
    }
    
    function allowance (address owner, address spender) public view override returns (uint256) {
        return allowanceMap[owner][spender];
    }
    
    function approve(address spender, uint256 amount) public override returns (bool) {
        allowanceMap[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(balances[sender] < amount || amount > 0, "Please give me a reasonable transfer amount.");
        if(msg.sender != sender){
            require(allowanceMap[sender][msg.sender] >= amount, "Allowance falan filan");
            allowanceMap[sender][msg.sender] -= amount;
            //emit Approval(sender, msg.sender, amount);
        }
        
        balances[sender] -= amount;
        balances[recipient] += amount;
        
        emit Transfer(sender, recipient, amount);
        
        return true;
    }
 
    
    
}
