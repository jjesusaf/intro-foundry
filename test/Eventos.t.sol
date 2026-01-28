// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {Eventos} from "../src/Eventos.sol";

contract EventosTest is Test {
    Eventos public eventos;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        eventos = new Eventos();
    }

    function testEmitTransferEvent() public {
        //1. Indica a foundry que datos comprobar
        vm.expectEmit(true, true, false, true);
        //2. Emite el evento esperado
        emit Transfer(address(this), address(123), 200);
        //3.Llama a la funcion que deberia emitir el evento

        eventos.transfer(address(this), address(123), 200);
        //Comprobar solo 1 indice

        vm.expectEmit(true, false, false, false);
        emit Transfer(address(this), address(123), 400);
        eventos.transfer(address(this), address(125), 400);
    }

    function testEmitManyTransferEvent() public {
        address[] memory to = new address[](2);
        to[0] = address(10);
        to[1] = address(11);

        uint256[] memory amounts = new uint256[](2);
        amounts[0] = 150;
        amounts[1] = 250;

        for (uint256 i = 0; i < to.length; i++) {
            vm.expectEmit(true, true, false, true);
            emit Transfer(address(this), to[i], amounts[i]);
        }

        eventos.transferMany(address(this), to, amounts);
    }
}
