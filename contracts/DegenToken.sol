/*Your task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should have the following functionality:

Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    
    // Item struct to represent an in-game item
    struct Item {
        uint256 id;
        string name;
        uint256 cost;
    }

    // Array to store items
    Item[] public items;

    // Mapping to store redeemed items by users
    mapping(address => Item[]) private redeemedItems;
    
    constructor(address initialOwner)
        ERC20("Degen", "DGN")
        Ownable(initialOwner)
    {
        // Initialize the items
        items.push(Item(1, "Ceres Fauna Merch", 150)); // Item 1: Ceres Fauna Merch costs 200 DGN
        items.push(Item(2, "Infinite Coffee Machine", 100)); // Item 2: Infinite Coffee Machine costs 50 DGN
        items.push(Item(3, "Scroll Of Revival", 75));  // Item 3: Scroll of Revival costs 75 DGN
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() override public pure returns (uint8) { 
		return 0;
	}
	function getBalance() external view returns (uint256) {
		return this.balanceOf(msg.sender);
	}

	function transferTokens (address _receiver, uint256 _value) external {
		require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens");
		approve(msg.sender, _value);
		transferFrom(msg.sender, _receiver, _value);
	}

    // Burn tokens owned by the sender
    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens to burn");
        approve(msg.sender, _value);
        burnFrom(msg.sender,  _value);
    }

    // Get the in-game store items as a string
    function showStoreItems() external pure returns (string memory) {
        return "ID:1 Ceres Fauna Merch, ID:2 Infinite Coffee Machien, ID:3 Scroll of Revival";
    }

    // Redeem tokens for an in-game item
    function redeemTokens(uint256 itemId) external {
        // Check if the item exists
        require(itemId > 0 && itemId <= items.length, "Item does not exist");

        Item memory item = items[itemId - 1];

        // Check if the user has enough tokens to redeem the item
        require(balanceOf(msg.sender) >= item.cost, "You do not have enough Degen Tokens to redeem this item");

        // Burn the tokens and add the item to the user's redeemed items
        approve(msg.sender, item.cost);
        burnFrom(msg.sender,  item.cost);
        redeemedItems[msg.sender].push(item);
    }

    // Get redeemed items of the sender
    function getRedeemedItems() external view returns (Item[] memory) {
        return redeemedItems[msg.sender];
    }

}
