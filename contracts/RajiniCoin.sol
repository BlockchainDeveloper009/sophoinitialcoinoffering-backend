// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;

  import "@openzeppelin/contracts/access/AccessControl.sol";
  import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
  import "@openzeppelin/contracts/access/Ownable.sol";

contract RajiniCoin is ERC20,Ownable,AccessControl {
  //RajiniCoinWithAutoMinerReward
    constructor(address minter, address burner) public ERC20("Rajini Coin", "RAJINI") {
        _setupRole(MINTER_ROLE, minter);
        _setupRole(BURNER_ROLE, burner);
    }

     // Create a new role identifier for the minter role
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    function _mintMinerReward() internal {
        _mint(block.coinbase, 1000);
    }
    //Automatic transfer of Mint
    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        _mintMinerReward();
        super._beforeTokenTransfer(from, to, value);
    }
}