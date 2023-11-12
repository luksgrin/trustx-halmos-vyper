# @version ^0.3.9
"""
@title TotalPrice.vy
@notice A vyper contract imitating Halmos' TotalPrice.sol example contract.
@dev This contract is for demonstration purposes only.
@dev It tries to implement TotalPrice.sol as closely as possible.
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