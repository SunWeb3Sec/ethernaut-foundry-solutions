// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/08-Vault/Vault.sol";

contract ContractTest is Test {
 
    Vault level8 = Vault(payable(0x0Bf9dD7155295B8C26444084eC92392a69A873Ab));

    function setUp() public {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testExploit8() public {
      // read slot 1: cast storage 0x0Bf9dD7155295B8C26444084eC92392a69A873Ab 1 --rpc-url https://rpc.ankr.com/eth_sepolia

      console.log("Vault is :", level8.locked());
      level8.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
      console.log("Vault is :", level8.locked());

    }
  receive() external payable {}
}