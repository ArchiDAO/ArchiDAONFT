// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

/// @title ArchiDAO non-transferable NFT
/// @author Hico
/// @notice This on-chain NFT contract serves as gate access to the ArchiDAO website
/// @dev All function calls are currently implemented without side effects
/// @custom:experimental This is an experimental on-chain contract.
contract ArchiDAO is ERC721, Ownable, ERC721URIStorage {
    using Strings for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    Counters.Counter private _memberIds;

    // ArchiDAO NFT Image folder on IPFS.
    string public imageIPFSFolderURI = "https://ipfs.io/ipfs/QmRHgykzBUuQR4FuWUH2mtpabWagLSuxndjD3fK2c7ZJ89/";

    // Address to NFT index mapping
    mapping (address => uint256) public addressToNFTNumber;

    // Address to bool whitelisted member mapping
    mapping (address => bool) public whitelistedMember;

    // To create non-transferable mechanism (mimic soulbound)
    bool public isTokenTransferable = false;

    constructor() ERC721 ("ArchiDAO NFT", "ARCH") {
    }

    /// @notice Batch address whitelisting for minting eligibility of members
    /// @dev 
    /// @param _memberAddress: Multiple member addresses to be whitelisted
    function whitelistMember(address[] memory _memberAddress) public onlyOwner {
        // require(!whitelistedMember[_memberAddress], "Member already whitelisted");

        for(uint256 i = 0; i < _memberAddress.length; i++ ) {
            whitelistedMember[_memberAddress[i]] = true;
        }
    }

    /// @notice Remove a whitelisted address
    /// @dev 
    /// @param _memberAddress: Address to be removed
    function removeWhitelistedMember(address _memberAddress) public {
        require(whitelistedMember[_memberAddress], "Member not whitelisted");
        require(balanceOf(_memberAddress) < 1, "Member already minted NFT");

        whitelistedMember[_memberAddress] = false;
    }

    /// @notice Whitelisted addresses can mint ArchiDAONFT
    /// @dev When NFT minted the MemberSkills Struc is initiated with 0 values for all skills
    /// @custom:whitelist - Whitelisting not implemented for testing contract
    function mint() external {
        // require(whitelistedMember[msg.sender], "Address not whitelisted");
        require(addressToNFTNumber[msg.sender] == 0, "Already minted NFT");

        _tokenIds.increment();
        uint256 currentTokenId = _tokenIds.current();

        addressToNFTNumber[msg.sender] = currentTokenId;

        _safeMint(msg.sender, currentTokenId);

        _setTokenURI(currentTokenId, getTokenURI(currentTokenId));
    }

    /// @notice Retrieves the tokenURI of the NFT metadata
    /// @dev Encodes the dataURI into base64
    /// @return Base64 encoded metadata of NFT viewable in browser
    function getTokenURI(uint256 tokenId) public view returns (string memory){

        bytes memory dataURI = abi.encodePacked(
                getTokenURIInitialMetadata(tokenId)
        );

        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    }

    /// @notice Builds the NFT metadata and encodes it to base64
    /// @dev Encodes the dataURI into base64.  
    /// @return Base64 encoded metadata - initial metadata
    function getTokenURIInitialMetadata(uint256 tokenId) internal view returns (string memory) {
        
        string memory memberTokenId = tokenId.toString();

        bytes memory dataURI = abi.encodePacked(
                '{ ',
                '"name": "ArchiDAO NFT"',  ', ',
                '"memberId": "', memberTokenId, '", ', 
                '"description": "ArchiDAO NFT membership", ',
                '"image": "', imageIPFSFolderURI, memberTokenId, '.png', '"' // Base64 or IPFS URI string, each token can get a different image if in IPFS folder from 1 - nth. Maybe just start with 50 members, then increase token count.//generateSkills(tokenId)
                ' }'
        );

        return string(
            dataURI
        ); 
    }

    /// @notice Changes the IPFS folder location URI
    /// @dev Can add any string of folder location which contains images, preferably IPFS
    function updateIPFSImageFolderURI (string memory newIPFSURI) public {
        imageIPFSFolderURI = newIPFSURI;
    }


    // The following functions are overrides required by Solidity.
    function _afterTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721)
    {
        super._afterTokenTransfer(from, to, tokenId, batchSize);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    /// @notice Before a token is transferred this function will run
    /// @dev Added require to ensure the token can not be transferred
    function transferFrom(address _from, address _to, uint256 _tokenId) 
        public 
        override(ERC721)
    {
    // Check if the NFT is transferable
    require(isTokenTransferable, "The NFT is soulbound and not transferable");

    // Perform the transfer as normal
    return super.transferFrom(_from, _to, _tokenId);
    }
}