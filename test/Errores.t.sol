// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Errores} from "../src/Errores.sol";

contract ErroresTest is Test {
    Errores public err;

    function setUp() public {
        err = new Errores();
    }

    function test_RevertWhen_ThrowErrorIsCalled() public {
        vm.expectRevert();
        err.throwError();
    }

    function testRequireMessage() public {
        vm.expectRevert(bytes("No autorizado"));
        err.throwError();
    }

    function testCustomError() public {
        vm.expectRevert(Errores.NoAutorizado.selector);
        err.throwCustomError();
    }

    function testErrorLabel() public pure {
        assertEq(uint256(1), uint256(1));
    }

    function testErrorLabelTwo() public pure {
        assertEq(uint256(1), uint256(1), "Tes 1");
        assertEq(uint256(1), uint256(1), "Tes 2");
        assertEq(uint256(1), uint256(1), "Tes 3");
        assertEq(uint256(1), uint256(1), "Tes 4");
        assertEq(uint256(1), uint256(1), "Tes 5");
        assertEq(uint256(1), uint256(1), "Tes 6");
    }
}
