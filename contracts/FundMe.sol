// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract fundme {
    using PriceConverter for uint256;

    uint public minimumAmountInUsd = 50 * 1e18;

    address[] public funders;

    mapping(address => uint256) addressTOAmountFunded;

    address public owner;

    AggregatorV3Interface public priceFeed;

    constructor(address priceFeedAddress) {
        owner = msg.sender;
        priceFeed = AggregatorV3Interface(priceFeedAddress);
    }

    // fund function
    function fund() public payable {
        require(
            msg.value.getConversionRate(priceFeed) > minimumAmountInUsd,
            "Amount insufficent to process tranction "
        );
        //require(getConversionRate(msg.value) > minimumAmountInUsd,"Amount insufficent to process tranction ");
        funders.push(msg.sender); // msg.value and msg.sender are always availabe global vatiables == amount and whoaddress
        addressTOAmountFunded[msg.sender] = msg.value; // dictonary of people and there amount funded
    } // how to reset an Array : Nameofthearraytoberest = new  address [] (0); with zero objects in the array

    // withdraw function

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender is not owner");
        _;
    }

    function withdraw() public payable onlyOwner {
        for (uint256 i = 0; i < funders.length; i++) {
            address funder = funders[i]; // after withdrawing the amount reseting the funders list and dict to zero
            addressTOAmountFunded[funder] = 0;
        }

        funders = new address[](0); // resetting the array to a new array  with  zero objects in it
        // now we have to send / transfer the money from the account
        // can be done using : transfer , send and call
        // out of the three call is the most prefered way of sending the ether

        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "call failed");

        /*(bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed"); */
    }
}
