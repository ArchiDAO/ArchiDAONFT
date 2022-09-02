# ArchiDAO NFTS

The ArchiDAO NFT is the membership and governance token for ArchiDAO. It serves a dual purpose: serving as a membership ID and governance vehicle, but also as the credentials for each member of the organisation. We will make every effort so that The NFT is structured so that it is compliant with the W3C Verifiable Credentials, as described here:
[Verifiable Credentials](https://www.w3.org/TR/vc-data-model/)

However the technican implementation of the ArchiDAO NFTs will be based around Soulbount Tokens (SBT) as referenced here: [Decentralised Society:Finding Web3's Soul](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4105763)

The reference implementation seems to be EIP-4973. The discussion at Ethereum-Magicians is here: [EIP4972 -Account-bound tokens](https://ethereum-magicians.org/t/eip-4973-account-bound-tokens/8825)

The code for EIP-4973 is located here: [EIP4973 reference implementation](https://github.com/rugpullindex/ERC4973/)

Beyond credentials each ArchiDAO NFT also has the governance utility in the organisation, i.e holders may participate in governance decisions to steer the ArchiDAO.

This current repository version is a temporary development one, until we structure the whole architecture and infrastructure, which might contain more than one token and project smart contract. Then this repostory will migrate to a "verifiable credentials & governance NFT"  


# ArchiDAO governance
 The basic premise of ArchiDAO is that we use a multi-governance system- the ArchiDAO NFT acts as your Identity and credentials and is used to govern the DAO in important decisions - for fast decisions on a daily basis ArchiDAO uses Snapshot and its own ENS, to allow for say selecting a background for a workshop or a particular tutorial in a workshop. For Project governance, ArchiDAO uses its own ERC20 token which has both staking and project governance mechanisms, to apply into projects. As such only members who are staked on a project can govern that project. Hence a member has three ways to influence and participate in decisions: govern via their ArchiDAO NFT, make choices via Snapshot, and stake to participate in a project's outcome via governance tokens.

 This takes place as we believe that governance rights of the organisation should not be really transferable. See [Soulbound tokens](https://vitalik.ca/general/2022/01/26/soulbound.html) for a more in depth explanation.

 Important Governance platforms:
[Tally](https://www.tally.xyz/)  
[SnapShot](snapshot.org)  

* 1 member = 1 vote
* votes can be delegated as per ERC721Vote

# ArchiDAO credentials
What type of credentials might we need?
- competence and knowledge
- proof of attendance to a conference / workshops
- experience in developing projects, i.e track record.


# Scope
  - Identifying ArchiDAO membership
  - Allowing and enabling ArchiDAO governance
  - Funding Public goods
  - Protocol maintenance and upgrades (as per [Voting](https://vitalik.ca/general/2021/08/16/voting3.html) )


# Stakeholders (check the verifiable credentials at W3)
- ArchiDAO Members (token holders - One member=one ArchiDAO NFT)
- Validator
- Project Owner
- NFT user- Owner
- Reader
- Other contracts : learning and proejct Contracts

# NFT Skill Smart Contract Parameters
**MVP**
* NFT-
  * Dynamic NFT through Chainlink.
  * Dynamic MetaData to be updated via chainlink oracles ?
  * Dynamic MetaData to be updated via another contract action?
  * how do we express this as a graph?
  * Alias
  * Governance votes
  * No stakes for ERC721 - stakes should be implemented with governace ERC20 votes

* Non-Transferable
* Validation and activation function
* Validation via using the ArchiDAO Multi-sig public key - is there a way to do mass-validation of users / token minting?

**FULL**
* Time
  - hours spent on projects
    - staked
    - available
* record of experience
    - web3
        - frontend
        - backend
        - smart Contracts
    - AEC:
      - Architectural design
      - Construction & Project Management
      - Engineering
*  dework.xyz tasks feed into the token?

  * Zero Knowledge Proofs incorporated in?



# Projects Smart Contract Parameters [forked into another repository]
**MVP**
* Project
  - Name
  - Owner
  - Brief
  - Deadline
  - Skills needed
    - Whitelisted categories / skills (by projects owner)
    - mh (manhours on each skill)


**FULL**
* Time
  - manhours spent on projects
    - staked
    - available
* Skills needed
    - Whitelisting features for the project owner


# ArchiDAO Project Smart Contract parameters [forked into another repository]
    **MVP**
    - stake
    - unstake
    - make rewards avaiable for Claim
    - terminate contracts


# Skills Classification for MetaDATA
**MVP** [break these down to structs for on-chain, and some included in metadata for off-chain / metadata is probably better]
- Current
  - Core
    - [develop here those that are key for ArchiDAO]
    - Design
        - Architecture
        - Interior
        - Urban
        - Landscape
    - Coding
        - Solidity
        - JavaScript
        - Python
        - C#
    - Modeling
        - Rhino
        - Grasshopper
        - Blender
        - Revit
        - ArchiCAD
        - 2D drawing
        - metaverse
    - Communication
        - PR
        - HR
        - Marketing
        - Socials
    - Legal
        - Codes
        - Architectural license
        - Building law
    - Academic
        - writing
        - funding
        - teaching
    - Project Management
        - Scheduling
        - Budgeting
        - Quality Management (QA / QC)

- Desirable
  - We need a mechanism that turns desirablle skills to Current skills, probably through validation at a workshop, class, event.
  - User to add desirable skills - signal which workshops to prioritise next.

**FULL**
- Track Record
  - Events ID
  - Date for each Events
  - Project finished successfully
  - Project started but abandoned- project finished or halted-
  - Project started but still active.

**FULL**
- User defined skills field.


# Frontend Interface Parameters
**MVP**
- * Info-
  - Name
  - contact email.
  - bio
- Desirable skills
- Intial Core skills commit

- Token Management  
  - Stake
  - Unstake
  - Claim rewards
  - Burn ? - insert a social function to activate burning.- (**FULL**)

# Process on Issuing the NFTs
- Registry of membership
- name, email, bio ? - how do we make this GDPR compliant?
- ETH address
- Could we initially issue them through educational workshops?


# Security Features
**FULL**
- Burn - How do we burn NFTs from hacked accounts- needs control structure implemented in the contract.
- could we have a metadata backup function ?
- Mirror NFTs from Hacked Accounts then burn the originator-  under certain conditions


# Examples
* [konsollidate](https://www.konsolidate.eu/stories/vc-solid-blockchain)
* [verifiable credentials on wikipedia](https://en.wikipedia.org/wiki/Verifiable_credentials)
* [Verifiable credentials on Web3 Consortium](https://www.w3.org/TR/vc-data-model/)
* [W3C example implementations](https://w3c.github.io/vc-test-suite/implementations/)


# Technologies and tooling to use
- [polygon](https://polygon.technology/)
- [Filecoin](https://docs.filecoin.io/about-filecoin/ipfs-and-filecoin/)
- livepeer ?
- [NFTport](NFTport.xyz)
- TheGraph
- [NFT standards](https://www.nftstandards.wtf/NFT+Standards+Wiki+-+READ.me)
- [Harmony](https://open.harmony.one/)
- [Moralis](https://moralis.io
- [Veramo](https://veramo.io/)  
- [Forward protocol](https://forwardprotocol.io/)

# References for Skills Classification  
  * [Competency Framework](https://www.skills-base.com/competency-framework)
  * [Unesco Skills classification](http://uis.unesco.org/sites/default/files/documents/international-standard-classification-of-education-fields-of-education-and-training-2013-detailed-field-descriptions-2015-en.pdf)
  * [International Standard Classification of Occupations](https://www.ilo.org/public/english/bureau/stat/isco/)
  * [European Skills/Competencies Framework](https://ec.europa.eu/esco/portal/documents)

# ToDo-
- Friday: Finish project descriptions
- Saturday: morning build and test two strategies for saving metadata- on chain or on ipfs
evening: interface

# Technical Implementation

* OnChain-
Polygon TestNet

- possibility of encoding all parameters of the NFT onchain with base 64 (not the recomended solution):
code all parameters of the NFT onChain
coinvert into BASE64 - (Base64 is a group of binary-to-text encoding schemes that represent binary data)
render the NFT in .svg - This allows to render directly onchain data-

# Specifications
 [ERC721Vote](https://docs.openzeppelin.com/contracts/4.x/api/token/erc721#ERC721Votes)
 [Verifiable Credentials](https://www.w3.org/TR/vc-data-model/)


* OffChain-


# References (Projects, constracts, examples)

- [Avastars](https://github.com/NFT42/Avastars-Contracts)
- [Limits of cryptoeconomics](https://vitalik.ca/general/2021/09/26/limits.html)
- [building a community with NFTs and Verificable credentials](https://www.youtube.com/watch?v=WYtBTj14JQ4)
- [research erc721 enum struct NFT supply chain updates](https://github.com/whiteprompt/11187-research-erc721-nfts-solidity/blob/master/contracts/Package.sol)
- [extending the tokeURI](https://forum.openzeppelin.com/t/function-settokenuri-in-erc721-is-gone-with-pragma-0-8-0/5978/4)
