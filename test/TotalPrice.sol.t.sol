// SPDX-License-Identifier: AGPL-3.0
pragma solidity >=0.8.0 <0.9.0;

import {Test, console2} from "forge-std/Test.sol";
import {TotalPrice} from "src/TotalPrice.sol";

/// @custom:halmos --solver-timeout-assertion 0
contract TotalPriceTestSol is Test {

    TotalPrice internal totalPrice;

    function setUp() public virtual {
        totalPrice = new TotalPrice();
    }

    /*-------------------------------------------//
    //           Forge test functions            //
    //------------------------------------------ */

    function testTotalPriceBuggy(uint96 price, uint32 quantity) public view {
        uint128 total = totalPrice.totalPriceBuggy(price, quantity);
        assert(quantity == 0 || total >= price);
    }

    function testTotalPriceFixed(uint96 price, uint32 quantity) public view {
        uint128 total = totalPrice.totalPriceFixed(price, quantity);
        assert(quantity == 0 || total >= price);
    }

    function testTotalPriceFixedEqualsToConservative(uint96 price, uint32 quantity) public view {
        uint128 total1 = totalPrice.totalPriceFixed(price, quantity);
        uint128 total2 = totalPrice.totalPriceConservative(price, quantity);
        assert(total1 == total2);
    }

    /*-------------------------------------------//
    //          Halmos test functions            //
    //------------------------------------------ */

    function check_TotalPriceBuggy(uint96 price, uint32 quantity) public view {
        testTotalPriceBuggy(price, quantity);
    }

    function check_TotalPriceFixed(uint96 price, uint32 quantity) public view {
        testTotalPriceFixed(price, quantity);
    }

    function check_TotalPriceFixedEqualsToConservative(uint96 price, uint32 quantity) public view {
        testTotalPriceFixedEqualsToConservative(price, quantity);
    }

}