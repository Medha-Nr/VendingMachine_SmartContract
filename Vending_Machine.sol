// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;
contract VendingMachine {
address public owner;
mapping (address => uint) fruitJuiceBalances;

constructor() {
    owner = msg.sender;
    fruitJuiceBalances[address(this)] = 500;
}

function purchase(uint _quantity) public payable {
    require(msg.value >= _quantity * 3 ether, "You must pay the total amount of 3 ether per juice pack + gas fees. ");
     require(fruitJuiceBalances[address(this)] >= _quantity, "Sorry! Fruit Juice is currently out od stock.");
    fruitJuiceBalances[address(this)] -= _quantity;
    fruitJuiceBalances[msg.sender] += _quantity;
}

function reStock(uint _amount) public {
    require(msg.sender == owner, "Only the owner can restock.");
    fruitJuiceBalances[address(this)] += _amount; 
} 

function getTotalStockBalance() public view returns(uint) {
   return fruitJuiceBalances[address(this)];
} 

}
