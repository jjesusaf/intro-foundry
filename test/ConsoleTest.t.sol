// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

contract ConsoleTest is Test {
    function testLog() public pure {
        console.log("Log de prueba");
        console.logUint(333);
    }
}