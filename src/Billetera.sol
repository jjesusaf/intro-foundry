// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Billetera {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function retirar(uint cantidad) external {
        require(msg.sender == owner, "no eres el owner");
        (bool success, ) = owner.call{value: cantidad}("");
        require(success, "Transferencia fallida");
    }

    function setOwner(address _owner) external {
        require(msg.sender == owner, "no eres el owner");
        owner = payable(_owner);
    }
}
