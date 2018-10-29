pragma solidity ^0.4.11;

contract HelloWorld {
    function sayHello() public pure returns (string) {
        return ("Hello World");
    }
    function echo(string name) public pure returns (string) {
        return name;
    }
}