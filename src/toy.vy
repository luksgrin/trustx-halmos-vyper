# @version ^0.3.9
"""
@title toy.vy
@notice A toy contract imitating Halmos' Example.sol
@dev This contract is for demonstration purposes only.
@dev It tries to implement Example.sol as closely as possible.
"""


@external
@pure
def totalPriceBuggy(price: uint96, quantity: uint32) -> uint128:
    return convert(
        unsafe_mul(
            convert(price, uint120),
            convert(quantity, uint120)
        ),
        uint128
    )

@external
@pure
def totalPriceFixed(price: uint96, quantity: uint32) -> uint128:
    return unsafe_mul(
        convert(price, uint128),
        convert(quantity, uint128)
    )

@external
@pure
def totalPriceConservative(price: uint96, quantity: uint32) -> uint128:
    return convert(
        unsafe_mul(
            convert(price, uint256),
            convert(quantity, uint256)
        ),
        uint128
    )

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