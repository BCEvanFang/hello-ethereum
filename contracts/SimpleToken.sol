pragma solidity ^0.4.11;

contract SimpleToken {
    
    // 初始代幣數量
    uint256 INITIAL_SUPPLY = 10000;
    
    // 紀錄每個帳戶(address)對應的代幣數量(uint256)
    mapping(address => uint256) balances;

    // 將所有的代幣指定給建立合約的帳戶地址
    constructor() public {
        balances[msg.sender] = INITIAL_SUPPLY;
    }

    // transfer token for a specified address
    function transfer(address _to, uint256 _amount) public {
        
        // 限制轉帳金額不能超過帳戶持有的代幣數量
        require(balances[msg.sender] > _amount);

        balances[msg.sender] -= _amount;
        
        balances[_to] += _amount;
    }

    // Gets the balance of the specified address
    function balanceOf(address _owner) public constant returns (uint256) {
        return balances[_owner];
    }
}