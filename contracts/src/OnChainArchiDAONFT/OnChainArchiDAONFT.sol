// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

// import "hardhat/console.sol";
// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Votes.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
// import {Base64} from "./Base64.sol";

// To add AccessControl and Pausable 



contract OnChainArchiDAONFT is ERC721, ERC721URIStorage, EIP712, ERC721Votes {
    using Strings for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    Counters.Counter private _memberIds;

    // PNG image URI on IPFS, can update
    string public imageIPFSFolderURI = 'https://ipfs.io/ipfs/QmRHgykzBUuQR4FuWUH2mtpabWagLSuxndjD3fK2c7ZJ89/';

    //Member skills struct
    struct MemberSkills {
        uint256 memberId;
        uint256 projectsCompleted;
        uint256 skill_1;
        uint256 skill_2;
        uint256 skill_3;
        uint256 skill_4;
        uint256 skill_5;
    }
    //mapping to save member structs
    mapping (address => MemberSkills) public memberSkillsStructMap;
    // MemberSkills[] public memberSkills;

    //mapping for addresses to NFTS
    mapping (address => uint256) public addressToNFTNumber;

    //whitelist member
    mapping (address => bool) public whitelistedMember;

    //add whitelist mapping

    constructor() ERC721 ("ArchiDAO Skills NFT", "ARCH") EIP712("ARCH", "1") {
    }

    //whitelist member address and create memberSkills struct
    function whitelistMember(address _memberAddress) public {
        //require owner/access control to submit address (possibly do batch whitelisting)
        
        _memberIds.increment();
        uint256 currentMemberId = _memberIds.current();

        memberSkillsStructMap[_memberAddress] = MemberSkills(currentMemberId, 0, 0, 0, 0, 0, 0);

        whitelistedMember[_memberAddress] = true;

    }

    function removeWhitelistedMember(address _memberAddress) public {

    }

    //Minting NFT function
    function mint() public {
        //require whitelistedMember to mint
        // require(whitelistedMember[msg.sender], "Not whitelisted");

        //require can only mint 1 NFT (NFT's connected to addresses)
        // require(addressToNFTNumber[msg.sender] == 0, "Already minted NFT");

        _tokenIds.increment();
        uint256 currentTokenId = _tokenIds.current();

        addressToNFTNumber[msg.sender] = currentTokenId;

        _safeMint(msg.sender, currentTokenId);

        _setTokenURI(currentTokenId, getTokenURI(currentTokenId));
    }

    function getTokenURI(uint256 tokenId) public view returns (string memory){

        address addressOfNFTOwner = ownerOf(tokenId);
        MemberSkills storage memberSkillsStruct = memberSkillsStructMap[addressOfNFTOwner];
        // string memory memberProjectsCompleted = memberSkillsStruct.projectsCompleted.toString();
        string memory memberSkillLevel_1 = memberSkillsStruct.skill_1.toString();
        string memory memberSkillLevel_2 = memberSkillsStruct.skill_2.toString();
        string memory memberSkillLevel_3 = memberSkillsStruct.skill_3.toString();
        string memory memberSkillLevel_4 = memberSkillsStruct.skill_4.toString();
        string memory memberSkillLevel_5 = memberSkillsStruct.skill_5.toString();


        bytes memory dataURI = abi.encodePacked(
                getTokenURIInitialMetadata(tokenId),
                '"skill_1": "', memberSkillLevel_1, '",', 
                '"skill_2": "', memberSkillLevel_2, '",', 
                '"skill_3": "', memberSkillLevel_3, '",', 
                '"skill_4": "', memberSkillLevel_4, '",', 
                '"skill_5": "', memberSkillLevel_5, '",', 
            '}'
        );

        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    
    }

    function getTokenURIInitialMetadata(uint256 tokenId) internal view returns (string memory) {
        
        string memory memberTokenId = tokenId.toString();

        address addressOfNFTOwner = ownerOf(tokenId);
        MemberSkills storage memberSkillsStruct = memberSkillsStructMap[addressOfNFTOwner];
        string memory memberProjectsCompleted = memberSkillsStruct.projectsCompleted.toString();

        bytes memory dataURI = abi.encodePacked(
                '{',
                '"name": "ArchiDAO NFT"',  ',',
                '"memberId": "', memberTokenId, '",', 
                '"description": "NFT for member skills attained",',
                '"image": "', imageIPFSFolderURI, memberTokenId, '.png', '",' // Base64 or IPFS URI string, each token can get a different image if in IPFS folder from 1 - nth. Maybe just start with 50 members, then increase token count.//generateSkills(tokenId)
                '"Projects Completed": "', memberProjectsCompleted, '",'
        );

        return string(
            dataURI
        );
        
    }

    function updateIPFSImageFolderURI (string memory newIPFSURI) public {
        imageIPFSFolderURI = newIPFSURI;
    }

// CONTINUE FROM HERE /////
    //Update memberSkillsStruc with increased skill level
    function updateMemberSkills(uint tokenId, bool skill_1, bool skill_2) public {
        // require tokenexsists or membership exists

        address memberSkillsToUpdate = ownerOf(tokenId);

        MemberSkills storage memberSkillsStruct = memberSkillsStructMap[memberSkillsToUpdate];

        memberSkillsStruct.projectsCompleted++; //= memberSkillsStruct.projectsCompleted + 1;

        if(skill_1 == true) {
            memberSkillsStruct.skill_1++;
        }

        if(skill_2 == true) {
            memberSkillsStruct.skill_2++;
        }

        _setTokenURI(tokenId, getTokenURI(tokenId));
    }

    // The following functions are overrides required by Solidity.
    
    function _afterTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721, ERC721Votes)
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
}

    // function getLevels(uint256 tokenId) public view returns (string memory) {
    //     uint256 levels = tokenIdToMemberId[tokenId];
    //     return levels.toString();
    // }

    // function train(uint256 tokenId) public {
    //     require(_exists(tokenId), "Please use an existing token");
    //     require(ownerOf(tokenId) == msg.sender, "You must own this token to train it");
    //     uint256 currentLevel = tokenIdToMemberId[tokenId];
    //     tokenIdToMemberId[tokenId] = currentLevel + 1;
    //     _setTokenURI(tokenId, getTokenURI(tokenId));
    // }

    // function updateSkill1(uint256 tokenId) public returns (string memory) {
    //     require(_exists(tokenId), "Please use an existing token");
    //     require(ownerOf(tokenId) == msg.sender, "You must own this token to train it");

    //     uint256 currentSkillLevel = tokenIdToSkill1[tokenId];
    //     tokenIdToSkill1[tokenId] = currentSkillLevel + 1;
    //     _setTokenURI(tokenId, getTokenURI(tokenId));
    //     return tokenIdToSkill1[tokenId].toString();
    // }

