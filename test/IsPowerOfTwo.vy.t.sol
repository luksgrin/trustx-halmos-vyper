// SPDX-License-Identifier: AGPL-3.0
pragma solidity >=0.8.0 <0.9.0;

import {Test, console2} from "forge-std/Test.sol";
import {VyperDeployer} from "utils/VyperDeployer.sol";
import {IsPowerOfTwoTestSol} from "test/IsPowerOfTwo.sol.t.sol"; // Provides the same tests
import {IsPowerOfTwo} from "src/IsPowerOfTwo.sol"; // Will be used as interface

/// @custom:halmos --solver-timeout-assertion 0
contract ExampleTestVy is IsPowerOfTwoTestSol, VyperDeployer {

    function setUp() public override {
        isPowerOfTwo = IsPowerOfTwo(
            deployContract("src/", "IsPowerOfTwo")
        );
    }

    /*-------------------------------------------//
    //           Forge test functions            //
    //------------------------------------------ */

    // Inherited from IsPowerOfTwoTestSol

    /*-------------------------------------------//
    //          Halmos test functions            //
    //------------------------------------------ */

    // Inherited from IsPowerOfTwoTestSol
}
