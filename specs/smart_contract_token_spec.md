
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

# ArchiDAO SBT Skill Smart Contract Parameters
**MVP**
* NFT-general questions
  * Dynamic NFT through Chainlink.
  * Dynamic MetaData to be updated via chainlink oracles ?
  * Dynamic MetaData to be updated via another contract action?
  * how do we express this as a graph?
  * Alias
  * Governance votes -is this a struct? - do we assign weights? Core members?
  * No stakes for ERC721 - stakes should be implemented with governace ERC20 votes

* Non-Transferable

**STorage and Parameters**

- URI (universal Resource Locator- need to use IPFS)
- Struct
  * name / Alias
  * number issue


**Functions**

- minting and validating
- Governance
- Profile ?
-

**Events**

- token minted
- token validated
-

* Validation and activation function
* Validation via using the ArchiDAO Multi-sig public key - is there a way to do mass-validation of users / token minting?




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
