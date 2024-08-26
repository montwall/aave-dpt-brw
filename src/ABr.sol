// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IPool} from "./interfaces/IPool.sol";
import {IERC20} from "./interfaces/IERC20.sol";
import {IWrappedTokenGatewayV3} from "./interfaces/IWrappedTokenGatewayV3.sol";

contract ABr {
    IPool public aaveV3Pool;
    IWrappedTokenGatewayV3 public aaveV3WETHGateWay;
    IERC20 public usdc;

    constructor(address _aaveV3Pool, address _aaveV3WETHGateWay, address _usdcAddr) {
        aaveV3Pool = IPool(_aaveV3Pool);
        aaveV3WETHGateWay = IWrappedTokenGatewayV3(_aaveV3WETHGateWay);
        usdc = IERC20(_usdcAddr);
    }

    function dpETHAndBrUSDC(uint256 dpAmount, uint256 brAmount) public {
        // Deposit ETH into Aave
        aaveV3WETHGateWay.depositETH{value: dpAmount}(
            address(aaveV3Pool),
            address(this),
            0
        );

        // Borrow USDC
        aaveV3Pool.borrow(address(usdc), brAmount, 2, 0, address(this));

        // Transfer the borrowed USDC to the caller
        usdc.transfer(msg.sender, brAmount);
    }
}
