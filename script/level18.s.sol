// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/levels/18-MagicNumber/MagicNumber.sol";

contract ExploitScript is Script {
    MagicNumSolver MagicNumSolverAddr;
    MagicNum level18 = MagicNum(payable(0x8F846f8Ff8F1a9f8cdEC3bDC32C8e6950b7D724e));

    function run() public {
        vm.startBroadcast();
        MagicNumSolverAddr = new MagicNumSolver();
        level18.setSolver(address(MagicNumSolverAddr));
         vm.stopBroadcast();
    }
}

 
contract MagicNumSolver {
  constructor() {
    assembly {

      // This is the bytecode we want the program to have:
      // 00 PUSH1 2a /* push dec 42 (hex 0x2a) onto the stack */
      // 03 PUSH1  0 /* store 42 at memory position 0 */
      // 05 MSTORE
      // 06 PUSH1 20 /* return 32 bytes in memory */
      // 08 PUSH1 0
      // 10 RETURN
      // Bytecode: 0x602a60005260206000f3 (length 0x0a or 10)
      // Bytecode within a 32 byte word:
      // 0x00000000000000000000000000000000000000000000604260005260206000f3 (length 0x20 or 32)
      //                                               ^ (offset 0x16 or 22)
      
      mstore(0, 0x602a60005260206000f3)
      return(0x16, 0x0a)
    }
  }
}