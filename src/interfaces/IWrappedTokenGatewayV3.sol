// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.10;

interface IWrappedTokenGatewayV3 {
  function depositETH(
    address pool,
    address onBehalfOf,
    uint16 referralCode
  ) external payable;

  function borrowETH(
    address pool,
    uint256 amount,
    uint256 interestRateMode,
    uint16 referralCode
  ) external;
}