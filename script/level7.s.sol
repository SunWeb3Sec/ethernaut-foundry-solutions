// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

//cast balance 0xf541649Ac6C05331CcCfEFe164baa3EbB3e112b8 --rpc-url https://rpc.ankr.com/eth_sepolia

contract Forced{
    constructor () public payable {
        selfdestruct(0xf541649Ac6C05331CcCfEFe164baa3EbB3e112b8);
    }
}