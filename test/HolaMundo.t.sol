// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {HolaMundo} from "../src/HolaMundo.sol";

contract HolaMundoTest is Test {
    HolaMundo public holaMundo;

    function setUp() public {
        holaMundo = new HolaMundo();
    }

    function test_MensajeInicial() public view {
        assertEq(holaMundo.obtenerMensaje(), "Hola mundo desde Foundry");
    }

    function test_ActualizarMensaje() public {
        holaMundo.actualizarMensaje("Nuevo mensaje");
        assertEq(holaMundo.obtenerMensaje(), "Nuevo mensaje");
    }
/*
    function testFuzz_ActualizarMensaje(string memory nuevoMensaje) public {
        holaMundo.actualizarMensaje(nuevoMensaje);
        assertEq(holaMundo.obtenerMensaje(), nuevoMensaje);
    }*/
}
