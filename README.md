# ArchiDAO NFTS
NFTs for Skills for Architecture -This is a the membership token for proofing skills and experience on the ArchiDAO.
 (archiDAO.io) It is also used as a governance token, proof of memebership in the organisation and a vehicle for the member to engage on-chain with the organisation.


# ArchiDAO governance
 The basic premise of ArchiDAO is that we use a multi-governance system- the ArchiDAO NFT acts as your ID and is used to govern the DAO in importnat decisions - for fast decisions on a daily basis ArchiDAO uses Snapshot and its own ENS, to allow for say selecting a bacground for a workshop or a particular tutorial in a workshop. For Project governance, ArchiDAO uses its own ERC20 token which has both stakes and governance mechanisms, to apply into projects. As such only members who are staked on a project can govern that project. Hence a meber has three ways to influence and participate in decisions: govern via their ArchiDAO NFT, make choices via Snapshot, and stake and participate in a project's outcome via governance tokens.

 This takes place as we believe that governance rights should not be really transferable. See [Soulbound tokens](https://vitalik.ca/general/2022/01/26/soulbound.html) for a more in depth explanation.

 Important Governance platforms:
[Tally](https://www.tally.xyz/)  
[SnapShot]()  



# Stakeholders
- ArchiDAO Members (token holders - One member=one ArchiDAO NFT)
- Validator
- Project Owner
- NFT user- Owner
- Reader


# NFT Skill Smart Contract Parameters
**MVP**
* NFT-
  * Dynamic NFT through Chainlink.
  * Dynamic MetaData to be updated via chainlink oracles
  * Alias
  * Governance votes
  * No stakes for ERC721 - stakes should be impemented with governace ERC20 votes]


* Non-Transferable
* Validation and activation function

**FULL**
* Time
  - manhours spent on projects
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


# Projects Smart Contract Parameters
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


# Skills Classification for MetaDATA
**MVP** [break these down to structs for onchain, and some in include in metadata for off-chain / metadata is probably better]
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
        - architectural license
        - building law
    - Academic
        - writing
        - funding
        - teaching

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

# Governance
- possibilities:
* 1 member = 1 vote


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

# Process on Issueing the NFTs
- Registry of membership
- name, email, bio ? - how do we make this GDPR compliant?
- ETH address


# Security Features
**FULL**
- Burn2 - How do we burn NFTs from hacked accounts?
- Mirror NFTs from Hacked Accounts then burn the originator. under certain conditions




# ArchiDAO Project Smart Contract parameters
**MVP**
- stake
- unstake
- make rewards avaiable for Claim
- terminate contracts




# technologies and tooling to use
- [polygon](https://polygon.technology/)
- [Filecoin](https://docs.filecoin.io/about-filecoin/ipfs-and-filecoin/)
- livepeer ?
- [NFTport](NFTport.xyz)
- TheGraph
- [NFT standards](https://www.nftstandards.wtf/NFT+Standards+Wiki+-+READ.me)
- [Harmony](https://open.harmony.one/)
- [Moralis](https://moralis.io/)

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
