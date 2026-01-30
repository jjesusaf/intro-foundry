// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Subasta} from "../src/Subasta.sol";

contract SubastaTest is Test {
    Subasta public subasta;
    uint256 private inicio;

    function setUp() public {
        subasta = new Subasta();
        inicio = block.timestamp;
    }

    function testOfertaAntesDeTiempo() public {
        vm.expectRevert(bytes("No puede ofertar"));
        subasta.oferta();
    }

    function testOferta() public {
        vm.warp(inicio + 1 days);
        subasta.oferta();
    }

    function testOfertaFallaDespuesDeTest() public {
        vm.expectRevert(bytes("No puede ofertar"));
        vm.warp(inicio + 200 days);
        subasta.oferta();
    }

    function testTimestamp() public {
        uint t = block.timestamp;
        skip(100);
        assertEq(block.timestamp, t + 100);

        rewind(10);
        assertEq(block.timestamp, t + 100 - 10);
    }

       function testBlockNumber() public {
        uint b = block.number;
        vm.roll(555);
        assertEq(block.number, 555);
      
    }
}
