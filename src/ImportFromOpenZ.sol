// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";


contract TestOwnable is Ownable {
    constructor() Ownable(msg.sender){}
}