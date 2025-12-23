// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract HolaMundo {
    string private mensaje;

    constructor() {
        mensaje = "Hola mundo desde Foundry";
    }

    function obtenerMensaje() public view returns (string memory) {
        return mensaje;
    }

    function actualizarMensaje(string memory _mensaje) public {
        mensaje = _mensaje;
    }
}
