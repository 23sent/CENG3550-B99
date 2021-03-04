pragma solidity ^0.8.0;

//ERC20 interface from https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol
import "./IERC20.sol";

contract S23 is IERC20 {
    
    function totalSupply () public view override returns (uint256) {
        return 0;
    }
    
    function balanceOf (address account) public view override returns (uint256) {
        return 0;  
    } 
    
    function transfer (address recipient, uint256 amount) public override returns (bool) {
        return true;
    }
    
    function allowance (address owner, address spender) public view override returns (uint256) {
        return 0;
    }
    
    function approve(address spender, uint256 amount) public override returns (bool) {
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        return true;
    }
}
