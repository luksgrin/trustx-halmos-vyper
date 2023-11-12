// SPDX-License-Identifier: AGPL-3.0
pragma solidity >=0.8.0 <0.9.0;

import {Test, console2} from "forge-std/Test.sol";
import {VyperDeployer} from "utils/VyperDeployer.sol";
import {TotalPriceTestSol} from "test/TotalPrice.sol.t.sol"; // Provides the same tests
import {TotalPrice} from "src/TotalPrice.sol"; // Will be used as interface

/// @custom:halmos --solver-timeout-assertion 0
contract TotalPriceTestVy is TotalPriceTestSol, VyperDeployer {

    function setUp() public override {
        totalPrice = TotalPrice(
            deployContract("src/", "TotalPrice")
        );
    }

    /*-------------------------------------------//
    //           Forge test functions            //
    //------------------------------------------ */

    // Inherited from TotalPriceTestSol

    /*-------------------------------------------//
    //          Halmos test functions            //
    //------------------------------------------ */

    // Inherited from TotalPriceTestSol
}
