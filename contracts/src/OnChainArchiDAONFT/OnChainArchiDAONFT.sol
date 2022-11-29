// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
// import "@openzeppelin/contracts/utils/Base64.sol";
import {Base64} from "./Base64.sol";

contract OnChainArchiDAONFT is ERC721URIStorage  {
    using Strings for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    mapping(uint256 => uint256) public tokenIdToMemberId;
    mapping(uint256 => string) public tokenIdToBio;
    // mapping(uint256 => uint256) public tokenIdToSkills2;

    constructor() ERC721 ("ArchiDAO Skills NFT", "ARCH"){
    }

// insert function to generate string BIO data which can change
// '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">', "Skill_2: ",getLevels(tokenId),'</text>', //stack too deep
// ,tokenIdToMemberId[tokenId]
    function generateSkills(uint256 tokenId) public view returns(string memory) {

        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
            '<style>.base { fill: white; font-family: serif; font-size: 14px; }</style>',
            '<rect width="100%" height="100%" fill="black" />',
            '<text x="50%" y="40%" class="base" dominant-baseline="middle" text-anchor="middle">','ArchiDAO Skills of Member NFT ', tokenIdToMemberId[tokenId].toString(),'</text>',
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">', 'Member BIO: ', tokenIdToBio[tokenId],'</text>', 
            '</svg>'
        );
        return string(
            abi.encodePacked(
                "data:image/svg+xml;base64,",
                Base64.encode(svg)
            )    
        );
    }

    // function getLevels(uint256 tokenId) public view returns (string memory) {
    //     uint256 levels = tokenIdToMemberId[tokenId];
    //     return levels.toString();
    // }

    function writeBio(uint256 tokenId, string memory bio) internal {
        tokenIdToBio[tokenId] = bio;
    }



    function getTokenURI(uint256 tokenId) public view returns (string memory){
        bytes memory dataURI = abi.encodePacked(
            '{',
                '"name": "ArchiDAO NFT"',  ',',
                '"memberId": "', tokenId.toString(), '",', 
                '"description": "NFT for member skills attained",',
                '"image": "', generateSkills(tokenId), '",',
                '"skill_1": "0",', 
                '"skill_2": "0",', 
                '"skill_3": "0",', 
                '"skill_4": "0",', 
                '"skill_5": "0",', 
            '}'
        );
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    }

    function mint(string memory bio) public {
        _tokenIds.increment();
        uint256 currentMemberId = _tokenIds.current();
        writeBio(currentMemberId, bio);

        _safeMint(msg.sender, currentMemberId);
        tokenIdToMemberId[currentMemberId] = 0;
        _setTokenURI(currentMemberId, getTokenURI(currentMemberId));
    }

    function train(uint256 tokenId) public {
        require(_exists(tokenId), "Please use an existing token");
        require(ownerOf(tokenId) == msg.sender, "You must own this token to train it");
        uint256 currentLevel = tokenIdToMemberId[tokenId];
        tokenIdToMemberId[tokenId] = currentLevel + 1;
        _setTokenURI(tokenId, getTokenURI(tokenId));
    }
}