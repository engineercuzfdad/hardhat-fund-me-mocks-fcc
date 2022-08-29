// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getprice(AggregatorV3Interface priceFeed)
        public
        view
        returns (uint256)
    {
        // price of eth -> usd
        (, int price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10); // 3000000000000 eth->usd
    }

    function getConversionRate(
        uint256 ethAmount,
        AggregatorV3Interface priceFeed
    ) public view returns (uint256) {
        uint256 ethPrice = getprice(priceFeed);
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
