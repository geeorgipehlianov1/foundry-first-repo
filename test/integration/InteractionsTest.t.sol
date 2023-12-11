// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { Test, console } from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe} from "../../script/Interactions.s.sol";

contract InteractionsTest is Test {

    FundMe fundMe;

    address constant USER = address(1);
    uint256 constant SEND_VALUE = 0.1 ether; 
    uint256 constant STARTING_USER_BALANCE = 10 ether;
    uint256 constant GAS_PRICE = 1;


    function setUp() external {
        fundMe = new DeployFundMe().run();
        vm.deal(USER, STARTING_USER_BALANCE);
    }

    function testUserCanFundInteractions() public {
        FundFundMe fundFundMe = new FundFundMe();
        fundFundMe.fundFundMe(address(fundMe));

        address funder = fundMe.getFunder(0);
        assertEq(funder, USER);
    }
}
