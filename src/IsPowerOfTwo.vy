# @version ^0.3.9
"""
@title IsPowerOfTwo.vy
@notice A vyper contract imitating Halmos' IsPowerOfTwo.sol example contract.
@dev This contract is for demonstration purposes only.
@dev It tries to implement IsPowerOfTwo.sol as closely as possible.
"""

@external
@pure
def isPowerOfTwo(x: uint256) -> bool:
    return x != 0 and (x & unsafe_sub(x, 1)) == 0

@external
@pure
def isPowerOfTwoIter(x: uint256) -> bool:
    y: uint256 = x
    # No while loops so gotta do this (I know max iterations possible is 256)
    for i in range(256):
        if (y != 0 and (y & 1) == 0):
            y >>= 1
        else:
            break

    return y == 1