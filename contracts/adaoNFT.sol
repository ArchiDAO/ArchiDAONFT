// SPDX-License-Identifier: MIT
// initial structure provided by openzeppelin wizzard: https://docs.openzeppelin.com/contracts/4.x/wizard
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/draft-ERC721Votes.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract AdaoNFT is ERC721, ERC721Enumerable, Pausable, Ownable, ERC721Burnable, EIP712, ERC721Votes {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("adaoNFT", "ADN") EIP712("adaoNFT", "1") {}

    using SafeMath for uint256;


    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://";
    }


    //@dev basic functions to pause and unpause the contract
    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    //@dev basic function to mint the NFT

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    //@dev controls the state of the NFTs- minted is the creation, validated is signed by another member.
    //@dev uncomment after the struct works

    enum Status {null, validated, active, inactive}
    //  active  //@dev to be activated in the full version, will require staking
    //  inactive //@dev to be activated in the full version, will require staking
    // null is 0
    // validated is 1
    // active is 2
    // inactive is 3

    Status public status;

    function getStatus() public view returns (Status) {
      return status;
    }

    function setStatus(Status _status) public {
      status = _status;
    }




    //@dev transfer should actually be de-activated
    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    //@dev The following functions are overrides required by Solidity.
    function _afterTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Votes)
    {
        super._afterTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
