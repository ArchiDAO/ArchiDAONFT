# NFTS
NFTs for Skills for Architecture -This is a social token for proofing skills on the ArchiDAO
 (archiDAO.io)


# Stakeholders

- ArchiDAO Members
- Validator
- Project Owner
- NFT user- Owner
- Reader


# NFT Skill Smart Contract Parameters
**MVP**
* NFT-
  - Name
  - contact email.
  - bio
  - status: Valid / Pending
* Non-Transferable

**FULL**
* Time
  - manhours spent on projects
    - staked
    - available

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






# Skills Classification
**MVP** 
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
  - we need a mechanism that turns desirablle skills to Current skills
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



* OffChain-


# References (Projects, constracts, examples)

- [Avastars](https://github.com/NFT42/Avastars-Contracts)


# VS issues
https://medium.com/michaels-dapp-dev-tips/how-to-change-the-solidity-compiler-in-vs-code-4c2660a856da
