<div align="right">

  [![license](https://img.shields.io/github/license/block-foundation/solidity-community-land-trust?color=green&label=license&style=flat-square)](LICENSE.md)
  ![stars](https://img.shields.io/github/stars/block-foundation/solidity-community-land-trust?color=blue&label=stars&style=flat-square)
  ![contributors](https://img.shields.io/github/contributors/block-foundation/solidity-community-land-trust?color=blue&label=contributors&style=flat-square)

</div>

---

<div>
    <img align="right" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/logo/logo_gray.png" width="96" alt="Block Foundation Logo">
    <h1 align="left">Community Land Trust</h1>
    <h3 align="left">Block Foundation Smart Contract Series [Solidity]</h3>
</div>

---

<div>
<img align="right" width="75%" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/image/repository_cover/block_foundation-structure-03-accent.jpg"  alt="Block Foundation">
<br>
<details open="open">
<summary>Table of Contents</summary>
  
- [Introduction](#style-guide)
- [Quick Start](#quick-start)
- [Contract](#contract)
- [Development Resources](#development-resources)
- [Legal Information](#legal-information)
  - [Copyright](#copyright)
  - [License](#license)
  - [Warning](#warning)
  - [Disclaimer](#disclaimer)

</details>
</div>

<br clear="both"/>

---

<div align="right">

  ![Report a Bug](https://img.shields.io/badge/Report%20a%20Bug-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fissues%2Fnew%3Fassignees%3D%26labels%3DNeeds%253A%2BTriage%2B%253Amag%253A%252Ctype%253Abug-suspected%26template%3Dbug_report.yml)
  ![Request a Feature](https://img.shields.io/badge/Request%20a%20Feature-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fissues%2Fnew%3Fassignees%3D%26labels%3DNeeds%253A%2BTriage%2B%253Amag%253A%252Ctype%253Afeature-request%252CHelp%2Bwanted%2B%25F0%259F%25AA%25A7%26template%3Dfeature_request.yml)
  ![Ask a Question](https://img.shields.io/badge/Ask%20a%20Question-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fissues%2Fnew%3Fassignees%3D%26labels%3DNeeds%253A%2BTriage%2B%253Amag%253A%252Ctype%253Aquestion%26template%3Dquestion.yml)
  ![Make a Suggestion](https://img.shields.io/badge/Make%20a%20Suggestion-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fissues%2Fnew%3Fassignees%3D%26labels%3DNeeds%253A%2BTriage%2B%253Amag%253A%252Ctype%253Aenhancement%26template%3Dsuggestion.yml)
  ![Start a Discussion](https://img.shields.io/badge/Start%20a%20Discussion-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5&link=https%3A%2F%2Fgithub.com%2Fblock-foundation%2Fbrand%2Fdiscussions)

</div>

## Introduction

In this community land trust smart contract, we explore a sophisticated example of land management on the Ethereum blockchain. The CLT contract encapsulates multiple unique aspects of a trust, including land as unique parcels rather than indistinguishable units, trustees who have special privileges, dynamic pricing, and operations like land purchase, sale, and transfer among users.

The Community Land Trust contract models the sale and purchase of land as transactions on the Ethereum blockchain. Instead of treating land as indistinguishable units, the contract recognizes each land parcel as a unique entity, with an ID and an owner. This allows for more realistic representation and tracking of land ownership.

The contract recognizes the role of trustees in a land trust. Trustees have the power to change the price of land parcels. The owner of the contract, usually the trust, has the power to add or remove trustees. All these operations trigger events that provide transparency and traceability.

Users can buy available land parcels from the trust. When a land parcel is purchased, it is assigned to the buyer and can no longer be bought by others. Owners of land parcels have the flexibility to sell the parcels back to the trust or transfer ownership to other users. This allows for dynamic changes in the distribution of land ownership within the community land trust.

While this contract offers a robust and realistic representation of a community land trust, it serves as a starting point and should be customized according to the specific needs of the trust. As with any blockchain contract, it is critical to thoroughly test and audit the contract code before deploying it on the mainnet.

In summary, the Community Land Trust contract provides a sophisticated example of using Ethereum for managing real-world assets and transactions, demonstrating the immense potential of blockchain technology in revolutionizing how we handle and exchange value.

## Quick Start

> Install

``` sh
npm i
```

> Compile

``` sh
npm run compile
```

## Contract

This contract includes:

- `LandParcel`: A struct that represents a unique land parcel with an ID and owner.
- `landParcels`: A mapping from a land parcel ID to the LandParcel struct.
- `landOwners`: A mapping from an address to an array of land parcel IDs owned by that address.
- `purchaseLand`: A function for buying land parcels from the trust.
- `sellLand`: A function for selling land parcels back to the trust.
- `transferLand`: A function for transferring ownership of a land parcel to another user.
- `getLandParcels`: A function that returns all land parcel IDs owned by a user.

## Development Resources

### Other Repositories

#### Block Foundation Smart Contract Series

|                                   | `Solidity`  | `Teal`      |
| --------------------------------- | ----------- | ----------- |
| **Template**                      | [**>>>**](https://github.com/block-foundation/solidity-template) | [**>>>**](https://github.com/block-foundation/teal-template) |
| **Architectural Design**          | [**>>>**](https://github.com/block-foundation/solidity-architectural-design) | [**>>>**](https://github.com/block-foundation/teal-architectural-design) |
| **Architecture Competition**      | [**>>>**](https://github.com/block-foundation/solidity-architecture-competition) | [**>>>**](https://github.com/block-foundation/teal-architecture-competition) |
| **Housing Cooporative**           | [**>>>**](https://github.com/block-foundation/solidity-housing-cooperative) | [**>>>**](https://github.com/block-foundation/teal-housing-cooperative) |
| **Land Registry**                 | [**>>>**](https://github.com/block-foundation/solidity-land-registry) | [**>>>**](https://github.com/block-foundation/teal-land-registry) |
| **Real-Estate Crowdfunding**      | [**>>>**](https://github.com/block-foundation/solidity-real-estate-crowdfunding) | [**>>>**](https://github.com/block-foundation/teal-real-estate-crowdfunding) |
| **Rent-to-Own**                   | [**>>>**](https://github.com/block-foundation/solidity-rent-to-own) | [**>>>**](https://github.com/block-foundation/teal-rent-to-own) |
| **Self-Owning Building**          | [**>>>**](https://github.com/block-foundation/solidity-self-owning-building) | [**>>>**](https://github.com/block-foundation/teal-self-owning-building) |
| **Smart Home**                    | [**>>>**](https://github.com/block-foundation/solidity-smart-home) | [**>>>**](https://github.com/block-foundation/teal-smart-home) |

## Legal Information

### Copyright

Copyright &copy; 2023 [Block Foundation](https://www.blockfoundation.io/ "Block Foundation website"). All Rights Reserved.

### License

Except as otherwise noted, the content in this repository is licensed under the
[Creative Commons Attribution 4.0 International (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/), and
code samples are licensed under the [MIT License](https://opensource.org/license/mit/).

Also see [LICENSE](https://github.com/block-foundation/community/blob/master/LICENSE) and [LICENSE-CODE](https://github.com/block-foundation/community/blob/master/LICENSE-CODE).

### Disclaimer

**THIS SOFTWARE IS PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**
