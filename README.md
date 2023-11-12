# Halmos-Vyper integration test repository

This repository is the demo corresponding to my talk at [TrustX 23 Istanbul](https://www.secureum.xyz/trustx/).

It contains the two dummy examples provided by Halmos. The tests have been adapted and the contracts were translated into Vyper (as close as possible).

> Note that for this integration to work, I had to modify the `VyperDeployer.sol` in `snekmate/lib/utils` so that the string arguments are `string memory` instead of `string calldata`.

Run the following command to see the integration in action!

```bash
halmos --ffi
```

> Note: `--ffi` flag is necessary to compile the Vyper contracts

You can find the presentation slides [here](./presentation/A%20Unified%20Framework%20for%20Formal%20Verification%20of%20Vyper%20Bytecode%20using%20Halmos.pdf)