pragma solidity ^0.8.0;

/*
* This contract uses the OpenZeppelin SafeERC721 contract as a base and adds a whitelist of addresses that are 
* allowed to mint new tokens and a mapping of token ID to token characteristics. The mint function includes parameters for the token name, description, and image, which are stored in the tokenProperties mapping. 
* The getTokenProperties function allows for retrieving the stored properties of a specific token ID.
* It should be noted that this is a simplified example, and additional security measures such as access control and input validation should be added to the contract before deploying it to the mainnet.
*/

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/SafeERC721.sol";

contract MyNFT is SafeERC721 {
    // Whitelist of addresses that are allowed to mint new tokens
    address[] private whitelist;

    // Mapping of token ID to token characteristics
    mapping (uint256 => TokenProperties) private tokenProperties;

    struct TokenProperties {
        string name;
        string description;
        bytes image;
    }

    constructor() public {
        // Add the msg.sender address to the whitelist
        whitelist.push(msg.sender);
    }

    function addToWhitelist(address _address) public {
        require(msg.sender in whitelist, "Only whitelisted addresses can add to the whitelist.");
        require(_address != address(0), "Cannot add address 0 to the whitelist.");
        require(!(addressToIndex(_address) >= 0), "Address already exists in the whitelist.");
        whitelist.push(_address);
    }

    function mint(address _to, uint256 _tokenId, string memory _name, string memory _description, bytes memory _image) public {
        require(msg.sender in whitelist, "Only whitelisted addresses can mint new tokens.");
        require(_to != address(0), "Cannot mint to address 0.");
        super._mint(_to, _tokenId);
        tokenProperties[_tokenId] = TokenProperties(_name, _description, _image);
    }

    function getTokenProperties(uint256 _tokenId) public view returns (string memory, string memory, bytes memory) {
        TokenProperties storage tp = tokenProperties[_tokenId];
        return (tp.name, tp.description, tp.image);
    }

    function addressToIndex(address _address) private view returns (uint) {
        for (uint i = 0; i < whitelist.length; i++) {
            if (whitelist[i] == _address) {
                return i;
            }
        }
        return uint(-1);
    }
}