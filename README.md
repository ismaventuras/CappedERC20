# CappedERC20

Based on
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/

All but CappedERC20.sol are forked from the link above.

If you want to set a minting system this is not the code you're looking for.

On deployment, an uint256 needs to be passed as parameter to set the initial supply of the token, if you want to mint 1 millino token u would need 1*10^6 * 10 ** 18 , where 18 are the decimals of the token (to keep a concordance with ether and wei)
