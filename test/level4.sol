// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/04-Telephone/Telephone.sol";

contract ContractTest is Test {
 
    Telephone level4 = Telephone(payable(0x23485539AcF0d51EBa27d7feCcB766775E351F14));

    function setUp() public {
    //Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testExploit4() public {
        console.log("Current Owner is: ", level4.owner());
        //level4.changeOwner(0xEAce4b71CA1A128e8B562561f46896D55B9B0246);
        console.log("New Owner is: ", level4.owner());
        
    }
  receive() external payable {}
}