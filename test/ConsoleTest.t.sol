// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, stdError} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
contract ConsoleTest is Test {
    function testLog() public {
        console.log("Log de prueba", 333);
    }
  
}