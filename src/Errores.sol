// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Errores {
    error NoAutorizado();

    function throwError() external pure {
        require(false, "No autorizado");
    }

    function throwCustomError() public pure {
        revert NoAutorizado();
    }


}
