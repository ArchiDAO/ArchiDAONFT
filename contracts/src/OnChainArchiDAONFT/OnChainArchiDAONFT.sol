// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

// import "hardhat/console.sol";
// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//check snapshot for voting
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
// import {Base64} from "./Base64.sol";

contract OnChainArchiDAONFT is ERC721, Ownable, ERC721URIStorage {
    using Strings for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    Counters.Counter private _memberIds;

    // PNG image URI on IPFS, can update
    string public imageIPFSFolderURI = 'https://ipfs.io/ipfs/QmRHgykzBUuQR4FuWUH2mtpabWagLSuxndjD3fK2c7ZJ89/';

//need to have NFT to access to ERC20 tokens to be able to stake, be part of the project
    struct MemberSkills {
        uint256 memberId;
        uint256 skill_1; //engineering : value 0 - 100 max.
        uint256 skill_2; //design
        uint256 skill_3; //registration
        uint256 skill_4; //communication / management 
        uint256 skill_5; //academic / educating
        uint256 skill_6; //community / onboarding-management-growth
        uint256 skill_7; 
        uint256 skill_8;
        uint256 skill_9;
        uint256 skill_10;
        uint256 projectsCompleted; 
    }
    //MemberSkills Struct mapping
    mapping (address => MemberSkills) public memberSkillsStructMap;

    // struct ProjectDetail {
    //     string projectName;
    //     string projectDescription;
    //     string projectTimeline;
    //     string projectCost;
    //     uint256 skillPointsGained1;
    //     uint256 skillPointsGained2;
    //     uint256 skillPointsGained3;
    // }
    // // ProjectDetail struct mapping
    // mapping(address => (mapping(uint) => ProjectDetail)) projectDetails;

    //mapping for addresses to NFTS
    mapping (address => uint256) public addressToNFTNumber;

    //whitelist member
    mapping (address => bool) public whitelistedMember;

    // Used to make th eNFT non-transferable
    bool public isTokenTransferable = false;

    constructor() ERC721 ("ArchiDAO Skills NFT", "ARCH") {

    }

    //whitelist member address to enable minting
    function whitelistMember(address[] memory _memberAddress) public onlyOwner {
        // require(!whitelistedMember[_memberAddress], "Member already whitelisted");
        //require: integrate other requirements needed before address whitelisted (referral)

        //Batch whitelisting
        for(uint256 i = 0; i < _memberAddress.length; i++ ) {
            whitelistedMember[_memberAddress[i]] = true;
        }
    }

    // Remove whitelisted member that hasnt minted a token yet
    function removeWhitelistedMember(address _memberAddress) public {
        require(whitelistedMember[_memberAddress], "Member not whitelisted");
        require(balanceOf(_memberAddress) < 1, "Member already minted NFT");

        whitelistedMember[_memberAddress] = false;
    }

    //Minting NFT function
    function mint() public /*onlyRole(MINTER_ROLE)*/ {
        // Address must be whitelisted to be able ot mint
        // require(whitelistedMember[msg.sender], "Not whitelisted");

        // Each Address can only mint 1 NFT
        require(addressToNFTNumber[msg.sender] == 0, "Already minted NFT");

        //require: Additional requirements before being able to mint (time, cost)
        //IE must be whitelisted for certain amount of time and complete tasks

        _tokenIds.increment();
        uint256 currentTokenId = _tokenIds.current();

        memberSkillsStructMap[msg.sender] = MemberSkills(currentTokenId, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

        // Initialise ProjectDetail struct with mapping projectDetails

        addressToNFTNumber[msg.sender] = currentTokenId;

        _safeMint(msg.sender, currentTokenId);

        _setTokenURI(currentTokenId, getTokenURI(currentTokenId));
    }

    function getTokenURI(uint256 tokenId) public view returns (string memory){

        bytes memory dataURI = abi.encodePacked(
                getTokenURIInitialMetadata(tokenId),
                getSkillsURIMetadata(tokenId),
                getSkillsURIMetadata2(tokenId)
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

    function getSkillsURIMetadata(uint256 tokenId) internal view returns (string memory) {
        
        address addressOfNFTOwner = ownerOf(tokenId);
        MemberSkills storage memberSkillsStruct = memberSkillsStructMap[addressOfNFTOwner];

        string memory memberSkillLevel_1 = memberSkillsStruct.skill_1.toString();
        string memory memberSkillLevel_2 = memberSkillsStruct.skill_2.toString();
        string memory memberSkillLevel_3 = memberSkillsStruct.skill_3.toString();
        string memory memberSkillLevel_4 = memberSkillsStruct.skill_4.toString();
        string memory memberSkillLevel_5 = memberSkillsStruct.skill_5.toString();

        bytes memory dataURI = abi.encodePacked(
                '"skill_1": "', memberSkillLevel_1, '",', 
                '"skill_2": "', memberSkillLevel_2, '",', 
                '"skill_3": "', memberSkillLevel_3, '",', 
                '"skill_4": "', memberSkillLevel_4, '",', 
                '"skill_5": "', memberSkillLevel_5, '",'
        );

        return string(
            dataURI
        );
    }

    function getSkillsURIMetadata2(uint256 tokenId) internal view returns (string memory) {
        
        address addressOfNFTOwner = ownerOf(tokenId);
        MemberSkills storage memberSkillsStruct = memberSkillsStructMap[addressOfNFTOwner];

        string memory memberSkillLevel_6 = memberSkillsStruct.skill_6.toString();
        string memory memberSkillLevel_7 = memberSkillsStruct.skill_7.toString();
        string memory memberSkillLevel_8 = memberSkillsStruct.skill_8.toString();
        string memory memberSkillLevel_9 = memberSkillsStruct.skill_9.toString();
        string memory memberSkillLevel_10 = memberSkillsStruct.skill_10.toString();

        bytes memory dataURI = abi.encodePacked(
                '"skill_6": "', memberSkillLevel_6, '",', 
                '"skill_7": "', memberSkillLevel_7, '",', 
                '"skill_8": "', memberSkillLevel_8, '",', 
                '"skill_9": "', memberSkillLevel_9, '",', 
                '"skill_10": "', memberSkillLevel_10, '",', 
            '}'
        );

        return string(
            dataURI
        );
    }

    function updateIPFSImageFolderURI (string memory newIPFSURI) public {
        imageIPFSFolderURI = newIPFSURI;
    }

    //Update memberSkillsStruc with increased skill level
    function updateMemberSkills(uint tokenId, uint _skill_1, uint _skill_2) public {
        // require token exists
        // onlyOwner (multisig)

        address memberSkillsToUpdate = ownerOf(tokenId);

        MemberSkills storage memberSkillsStruct = memberSkillsStructMap[memberSkillsToUpdate];

        memberSkillsStruct.projectsCompleted++; 

        memberSkillsStruct.skill_1 = _skill_1;
        memberSkillsStruct.skill_2 = _skill_2;
        // memberSkillsStruct.skill_2 = _skill_3;
        // memberSkillsStruct.skill_2 = _skill_4;
        // memberSkillsStruct.skill_2 = _skill_5;
        // memberSkillsStruct.skill_2 = _skill_6;
        // memberSkillsStruct.skill_2 = _skill_7;
        // memberSkillsStruct.skill_2 = _skill_8;
        // memberSkillsStruct.skill_2 = _skill_9;
        // memberSkillsStruct.skill_2 = _skill_10;

        _setTokenURI(tokenId, getTokenURI(tokenId));
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