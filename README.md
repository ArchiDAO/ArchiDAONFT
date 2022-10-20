# ArchiDAO NFT

The ArchiDAO NFT is the governance token for ArchiDAO. It serves a dual purpose:  a governance vehicle and a membership record,  encapsulating the credentials for each member of the organisation. The NFT is structured so that it is compliant with the W3C Verifiable Credentials and decentralised identifiers, as described here:
[Verifiable Credentials](https://www.w3.org/TR/vc-data-model/)
[decentralised identifiers](https://www.w3.org/TR/did-core/)

The NFT holds the governance part while DiD and VC hold the credentials and experience part of the member identity.


One potential implementation would be  of the ArchiDAO NFTs around Soulbound Tokens (SBT) as referenced here: [Decentralised Society:Finding Web3's Soul](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4105763). Fundamentally we need to avoid "market fundamendalism" for governance and participation in the DAO, as both are social goods that are not captured alone by economic indicators, such as the fungible Tokens used for rewards and staking internally in the DAO.


# Soulbound Tokens
there are two EIPs for SBTs - EIP4973 and [EIP-5114](https://eips.ethereum.org/EIPS/eip-5114)

For reference implementation of EIP-4973, the discussion at Ethereum-Magicians is here: [EIP4972 -Account-bound tokens](https://ethereum-magicians.org/t/eip-4973-account-bound-tokens/8825)

The code for EIP-4973 is located here: [EIP4973 reference implementation](https://github.com/rugpullindex/ERC4973/)

Beyond credentials each ArchiDAO NFT also has the governance utility in the organisation, i.e holders may participate in governance decisions to steer the ArchiDAO.

This current repository version is a temporary development one, until we structure the whole architecture and infrastructure, which might contain more than one token and project smart contract. Then this repostory will migrate to a "verifiable credentials & governance NFT"  


# ArchiDAO governance
 The basic premise of ArchiDAO is that we use a multi-governance system- the ArchiDAO NFT acts as your Identity and credentials and is used to govern the DAO in important decisions - for fast decisions on a daily basis ArchiDAO uses Snapshot and its own ENS, to allow for say selecting a background for a workshop or a particular tutorial in a workshop. For Project governance, ArchiDAO uses its own ERC20 token which has both staking and project governance mechanisms, to apply into projects. As such only members who are staked on a project can govern that project. Hence a member has three ways to influence and participate in decisions: govern via their ArchiDAO NFT, make choices via Snapshot, and stake to participate in a project's outcome via governance tokens.

 This takes place as we believe that governance rights of the organisation should not be really transferable. See [Soulbound tokens](https://vitalik.ca/general/2022/01/26/soulbound.html) for a more in depth explanation.

 Important Governance platforms:
[Tally](https://www.tally.xyz/)  
[SnapShot](snapshot.org)  



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
- Saturday: Finish project descriptions
- Sunday: morning build and test two strategies for saving metadata- on chain or on ipfs
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


# References (Projects, constracts, examples, readings)

- [Avastars](https://github.com/NFT42/Avastars-Contracts)
- [Limits of cryptoeconomics](https://vitalik.ca/general/2021/09/26/limits.html)
- [building a community with NFTs and Verificable credentials](https://www.youtube.com/watch?v=WYtBTj14JQ4)
- [research erc721 enum struct NFT supply chain updates](https://github.com/whiteprompt/11187-research-erc721-nfts-solidity/blob/master/contracts/Package.sol)
- [extending the tokeURI](https://forum.openzeppelin.com/t/function-settokenuri-in-erc721-is-gone-with-pragma-0-8-0/5978/4)
- [The reputation problem in DAOs and why SBTs are important](https://otterspace.mirror.xyz/Cec_bTSsLgcohuaV5dkOJTbaYuFB6tF8jhxzN_30k1A)
- [SBTs vs Verifiable credentials](https://mirror.xyz/melzhou.eth/uC6PrFtQOvrF4xN5JWzWKQ8WEGYvHoQFKwsYpKEnrfc)
- [Awesome Soulbound Tokens](https://github.com/rugpullindex/awesome-soulbound-tokens)
