// SPDX-License-Identifier: AGPL-3.0
pragma solidity >=0.8.0 <0.9.0;

import {Test, console2} from "forge-std/Test.sol";
import {IsPowerOfTwo} from "src/IsPowerOfTwo.sol";

/// @custom:halmos --solver-timeout-assertion 0
contract IsPowerOfTwoTestSol is Test {

    IsPowerOfTwo internal isPowerOfTwo;

    function setUp() public virtual {
        isPowerOfTwo = new IsPowerOfTwo();
    }

    /*-------------------------------------------//
    //           Forge test functions            //
    //------------------------------------------ */

    function testIsPowerOfTwo(uint8 x) public view {
        bool result1 = isPowerOfTwo.isPowerOfTwo(x);
        bool result2 = x == 1 || x == 2 || x == 4 || x == 8 || x == 16 || x == 32 || x == 64 || x == 128;
        assert(result1 == result2);
    }

    function testIsPowerOfTwo(uint256 x) public view {
        bool result1 = isPowerOfTwo.isPowerOfTwo(x);
        bool result2 = false;
        for (uint i = 0; i < 256; i++) {
            if (x == 2**i) {
                result2 = true;
                break;
            }
        }
        assert(result1 == result2);
    }

    function testIsPowerOfTwoEq(uint x) public view {
        bool result1 = isPowerOfTwo.isPowerOfTwo(x);
        bool result2 = isPowerOfTwo.isPowerOfTwoIter(x);
        assert(result1 == result2);
    }


    /*-------------------------------------------//
    //          Halmos test functions            //
    //------------------------------------------ */

    function check_IsPowerOfTwo(uint8 x) public view {
        (bool success,) = address(this).staticcall(abi.encodeWithSignature(
            "testIsPowerOfTwo(uint8)",
            x
        ));
        require(success, "staticcall failed");
    }

    /// @custom:halmos --loop 256
    function check_IsPowerOfTwo(uint256 x) public view {
        (bool success,) = address(this).staticcall(abi.encodeWithSignature(
            "testIsPowerOfTwo(uint256)",
            x
        ));
        require(success, "staticcall failed");
    }

    /// @custom:halmos --loop 256
    function check_IsPowerOfTwoEq(uint x) public view {
        testIsPowerOfTwoEq(x);
    }

}