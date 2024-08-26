// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {IERC20} from "../src/interfaces/IERC20.sol";
import {ABr} from "../src/ABr.sol";

contract ABrTest is Test {
    address constant aaveV3PoolAddr = 0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2;
    address constant aaveV3WETHGateWayAddr = 0x893411580e590D62dDBca8a703d61Cc4A8c7b2b9;
    address constant usdcAddr = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    ABr public abr;

    function setUp() public {
        abr = new ABr(aaveV3PoolAddr, aaveV3WETHGateWayAddr, usdcAddr);

        vm.deal(address(abr), 1 ether);
    }

    function test_dpETHAndBrUSDC() public {
        IERC20 usdc = IERC20(usdcAddr);

        console.log("ETH balance before:", address(abr).balance);
        console.log("USDC balance before:", usdc.balanceOf(address(this)));

        abr.dpETHAndBrUSDC(1 ether, 1000000000);

        console.log("ETH balance after:", address(abr).balance);
        console.log("USDC balance after:", usdc.balanceOf(address(this)));
    }

    function test_borrow() public {
    }
}
