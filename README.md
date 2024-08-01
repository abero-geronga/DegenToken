# DegenToken Project

DegenToken (DGN) is an ERC20 token built on the Avalanche blockchain.

## Description

The DegenToken smart contract, developed in Solidity and deployed on the Avalanche blockchain, utilizes the OpenZeppelin library for a secure and standardized ERC20 token implementation. It includes the following main functions:

### Main Functions

1. **Minting** 
   - The platform owner can create new DegenTokens, enabling Degen Gaming to allocate tokens as rewards to players based on their performance and activities in the game.
   - Minting new tokens is restricted to the contract owner only.

2. **Burning**
   - If a player no longer needs a DegenToken, they can burn it. This functionality reduces the overall supply of tokens, which may increase the value of the remaining tokens.
   - The player must have equal to or more than the amount of tokens to be burned.

3. **Redeeming**
   - DegenTokens can be redeemed for special products in the in-game store. Each item has a certain token cost, and once redeemed, it is identified as such and cannot be redeemed again.
   - The player must have enough tokens to pay for the item, and it must not have been previously redeemed.

4. **Transferring**
   - Players have the ability to transfer their DegenTokens to others, fostering a vibrant in-game economy where tokens can be exchanged for goods, services, or other tokens.
   - The sender must possess an adequate balance of DegenTokens to be able to transfer.



## Getting Started

### Installation

* You can download or clone this repository
* Afterward, update the Hardhat configuration file to include your private keys for both the Fuji and Mainnet networks.

### Executing program

1. Open a terminal in your IDE
2. Run `npm install` to install dependencies
3. Run `npx hardhat run --network fuji scripts/deploy.js` to deploy to the fuji testnet (make sure you have enough AVAX testnet tokens)
4. I ran the contract functions through the Remix IDE
5. Run `npx hardhat verify [contract address] Degen DGN 100 --network fuji` in the console to verify the contract


## Help

1. If you lack enough tokens, you can search for the Avalanche testnet faucet online and obtain some from there.
2. If the verify command fails, there's a UI option on Snowtrace for verification, Run `npx hardhat flatten > FlattenedFileName.sol` to prepare the file for Snowtrace verification. Then, go to the verify option on Snowtrace, input the contract address and compiler version, and upload the flattened file.


## Authors

Contributors names and contact info

Abero Isaiah D. Geronga
