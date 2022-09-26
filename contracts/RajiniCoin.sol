// SPDX-License-Identifier: MIT
  pragma solidity ^0.8.0;

  import "@openzeppelin/contracts/access/AccessControl.sol";
  import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
  import "@openzeppelin/contracts/access/Ownable.sol";

contract RajiniCoin is ERC20,Ownable {
  //RajiniCoinWithAutoMinerReward
    constructor() ERC20("Rajini Coin", "RAJINI") {
        
    }



    function _mintMinerReward() internal {
        _mint(block.coinbase, 1000);
    }
    //Automatic transfer of Mint
    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        _mintMinerReward();
       // super._beforeTokenTransfer(from, to, value);
    }
}