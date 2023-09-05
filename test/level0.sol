// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "ds-test/test.sol";
import "forge-std/Vm.sol";
interface Instance {
function authenticate(string memory passkey) external;
function password() external view returns (string memory);
function getCleared() external view returns (bool);
}
contract ContractTest is DSTest {
    function setUp() public {
    }

    function testExploit() public {
        Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
        vm.createSelectFork(vm.rpcUrl("sepolia"));
        
        Instance level0 = Instance(0x044dD753634CaAa34c6F051D5A245e82bB65E4Fd);
        level0.password();
        level0.authenticate(level0.password());
        level0.getCleared();
    }
}
