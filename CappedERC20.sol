// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// using openzeppelin contracts to stay SAFU
import "./ERC20.sol";


/**
 *  While ERC20Capped from OpenZeppelin is great, you can mint over the maxsupply on initial deployment, to prevent that we require that total supply does not
 *  surpass max supply.
 */

contract CappedERC20 is ERC20 {
    
    // Max Supply is set to 31M, value is hardcoded so anyone can see the initial maxSupply that the deployer sets. can't be changed
    uint256 private _maxSupply = 31000000 * 10 ** decimals();
    
    // Create the ERC20 Token with IsmaToken as symbol and name (both will be retriveable from IERC20Metadata functions)
    constructor(uint256 initialSuply) ERC20("IsmaToken", "IsmaToken") {
        _mint(msg.sender, initialSuply); // Mint 31M of tokens and send it to the deployer of the contract.
    }
    
     /**
     * @dev Returns the cap on the token's total supply.
     */
    function getMaxSupply() public view returns (uint256) {
        return _maxSupply;
    }
    
    // Require that the total supply does not become higher than the maxSupply when minting, minting will 
    // only happen once as there's no public mint function to be called
    function _mint(address account, uint256 amount) internal virtual override {
        require(totalSupply() + amount <= getMaxSupply(), "ERC20Capped: cap exceeded");
        super._mint(account, amount);
    }
    
}