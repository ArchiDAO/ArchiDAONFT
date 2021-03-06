
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

//@dev generated from OZ wizzard.


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract SNFT is ERC721, ERC721Enumerable, ERC721URIStorage, Pausable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

//
//  string Name
//  string email
//  string bio


//@dev controls the state of the NFTs- minted is the creation, valiadted is signed by another member.
enum Status {
  minted,
  validated
//  active  //@dev to be activated in the full version, will require staking
//  inactive //@dev to be activated in the full version, will require staking
}

Status public status;

function setStatus(Status _status) public {
  status = _status;
}

struct Skill {
  address owner;
  uint256 architecture;
  uint256 interior;
  uint256 urban;

}

Skill [] public MetaArchitect;


address userAddress;


    constructor() ERC721("Skills NFT", "SNF") {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }


    function setSkill(address _userAddress, uint256 _architecture, uint256 _interior, uint256 _urban) public onlyOwner {
      skills.push(Skill(_userAddress, _architecture, _interior, _urban));


    }

//    function getSkills()

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

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
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
