<div align="right">

[![GitHub License](https://img.shields.io/github/license/block-foundation/blocktxt?style=flat-square&logo=readthedocs&logoColor=FFFFFF&label=&labelColor=%23041B26&color=%23041B26&link=LICENSE)](https://github.com/block-foundation/solidity-community-land-trust/blob/main/LICENSE)
[![devContainer](https://img.shields.io/badge/Container-Remote?style=flat-square&logo=visualstudiocode&logoColor=%23FFFFFF&label=Remote&labelColor=%23041B26&color=%23041B26)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/block-foundation/solidity-community-land-trust)

</div>

---

<div>
    <img align="right" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/logo/logo_gray.png" width="96" alt="Block Foundation Logo">
    <h1 align="left">Community Land Trust</h1>
    <h3 align="left">Block Foundation Smart Contract Series [Solidity]</h3>
</div>
---

<img align="right" width="75%" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/image/repository_cover/block_foundation-structure-03-accent.jpg"  alt="Block Foundation Brand">

### Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Quick start](#quick-start)
4. [Setup and Installation](#setup-and-installation)
5. [Usage](#usage)
6. [Contribution](#contribution)
7. [License](#license)
7. [Colophon](#colophon)

<br clear="both"/>

---

<div align="right">

[![Report a Bug](https://img.shields.io/badge/Report%20a%20Bug-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-community-land-trust/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=bug_report.yml)
[![Request a Feature](https://img.shields.io/badge/Request%20a%20Feature-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-community-land-trust/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=feature_request.yml)
[![Ask a Question](https://img.shields.io/badge/Ask%20a%20Question-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-community-land-trust/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=question.yml)
[![Make a Suggestion](https://img.shields.io/badge/Make%20a%20Suggestion-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-community-land-trust/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=suggestion.yml)
[![Start a Discussion](https://img.shields.io/badge/Start%20a%20Discussion-GitHub?style=flat-square&&logoColor=%23FFFFFF&color=%23E1E4E5)](https://github.com/block-foundation/solidity-community-land-trust/issues/new?assignees=&labels=Needs%3A+Triage+%3Amag%3A%2Ctype%3Abug-suspected&projects=&template=discussion.yml)

</div>

**The `CommunityLandTrust` smart contract facilitates the management and operations of land parcels within a decentralized land trust community. It allows users to buy and sell land parcels, transfer ownership, and provides an administrative interface for trustees and the contract owner.**

## Introduction

In this community land trust smart contract, we explore a sophisticated example of land management on the Ethereum blockchain. The CLT contract encapsulates multiple unique aspects of a trust, including land as unique parcels rather than indistinguishable units, trustees who have special privileges, dynamic pricing, and operations like land purchase, sale, and transfer among users.

The Community Land Trust contract models the sale and purchase of land as transactions on the Ethereum blockchain. Instead of treating land as indistinguishable units, the contract recognizes each land parcel as a unique entity, with an ID and an owner. This allows for more realistic representation and tracking of land ownership.

The contract recognizes the role of trustees in a land trust. Trustees have the power to change the price of land parcels. The owner of the contract, usually the trust, has the power to add or remove trustees. All these operations trigger events that provide transparency and traceability.

Users can buy available land parcels from the trust. When a land parcel is purchased, it is assigned to the buyer and can no longer be bought by others. Owners of land parcels have the flexibility to sell the parcels back to the trust or transfer ownership to other users. This allows for dynamic changes in the distribution of land ownership within the community land trust.

While this contract offers a robust and realistic representation of a community land trust, it serves as a starting point and should be customized according to the specific needs of the trust. As with any blockchain contract, it is critical to thoroughly test and audit the contract code before deploying it on the mainnet.

In summary, the Community Land Trust contract provides a sophisticated example of using Ethereum for managing real-world assets and transactions, demonstrating the immense potential of blockchain technology in revolutionizing how we handle and exchange value.

## Features

- **Purchase Land**: Users can purchase available land parcels by sending the specified Ether amount.
- **Sell Land**: Landowners can sell their parcels back to the trust.
- **Transfer Ownership**: Landowners can transfer their land parcels to another Ethereum address.
- **Admin Functions**: The contract owner and trustees have special permissions:
  - Set the price of land parcels.
  - Add or remove trustees.
  - Withdraw contract balance.

### Functions

This contract includes:

- `LandParcel`: A struct that represents a unique land parcel with an ID and owner.
- `landParcels`: A mapping from a land parcel ID to the LandParcel struct.
- `landOwners`: A mapping from an address to an array of land parcel IDs owned by that address.
- `purchaseLand`: A function for buying land parcels from the trust.
- `sellLand`: A function for selling land parcels back to the trust.
- `transferLand`: A function for transferring ownership of a land parcel to another user.
- `getLandParcels`: A function that returns all land parcel IDs owned by a user.

## Quick Start

> Install

``` sh
npm i
```

> Compile

``` sh
npm run compile
```

## Setup and Installation

### Prerequisites

- [Node.js](https://nodejs.org/)
- [Truffle Framework](https://www.trufflesuite.com/)
- [MetaMask](https://metamask.io/) or similar Ethereum web3 provider

### Steps

1. Clone this repository:

   ```bash
   git clone [Repository Link]
   ```

2. Change into the directory:

   ```bash
   cd CommunityLandTrustContract
   ```

3. Install dependencies:

   ```bash
   npm install
   ```

4. Compile the contract:

   ```bash
   truffle compile
   ```

5. Deploy the contract to a local Ethereum network using Truffle:

   ```bash
   truffle migrate --reset
   ```

Of course! Here's an expanded "Usage" section for the `README.md` detailing more function calls:

---

## Usage

1. **Buying Land**:

   ``` javascript
   contractInstance.purchaseLand({value: etherAmount});
   ```

2. **Selling Land**:

   ``` javascript
   contractInstance.sellLand(parcelId);
   ```

3. **Transferring Land**:

   ``` javascript
   contractInstance.transferLand(parcelId, recipientAddress);
   ```

4. **Setting Land Price (Trustees only)**:

   ``` javascript
   contractInstance.setLandPrice(newPrice);
   ```

5. **Fetching Land Parcels Owned by an Address**:

   ``` javascript
   let parcelsOwned = await contractInstance.getLandParcels(ownerAddress);
   console.log("Land Parcels:", parcelsOwned);
   ```

6. **Adding a Trustee (Owner only)**:

   ``` javascript
   contractInstance.addTrustee(newTrusteeAddress);
   ```

7. **Removing a Trustee (Owner only)**:

   ``` javascript
   contractInstance.removeTrustee(trusteeAddress);
   ```

8. **Withdrawing Contract Balance (Owner only)**:

   ``` javascript
   contractInstance.withdraw();
   ```

9. **Fetching Land Details by Parcel ID**:

   ``` javascript
   let landParcel = await contractInstance.landParcels(parcelId);
   console.log("Land Owner:", landParcel.owner);
   ```

10. **Checking Trustee Status**:

   ``` javascript
   let isTrustee = await contractInstance.trustees(addressToCheck);
   console.log("Is Trustee:", isTrustee);
   ```

---

## Colophon

### Authors

This is an open-source project by the **[Block Foundation](https://www.blockfoundation.io "Block Foundation website")**.

The Block Foundation mission is enabling architects to take back initiative and contribute in solving the mismatch in housing through blockchain technology. Therefore the Block Foundation seeks to unschackle the traditional constraints and construct middle ground between rent and the rigidity of traditional mortgages.

website: [www.blockfoundation.io](https://www.blockfoundation.io "Block Foundation website")

### Development Resources

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

#### Contributing

We'd love for you to contribute and to make this project even better than it is today!
Please refer to the [contribution guidelines](.github/CONTRIBUTING.md) for information.

### Legal Information

#### Copyright

Copyright &copy; 2023 [Stichting Block Foundation](https://www.blockfoundation.io/ "Block Foundation website"). All Rights Reserved.

#### License

Except as otherwise noted, the content in this repository is licensed under the
[Creative Commons Attribution 4.0 International (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/), and
code samples are licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0).

Also see [LICENSE](https://github.com/block-foundation/community/blob/master/src/LICENSE) and [LICENSE-CODE](https://github.com/block-foundation/community/blob/master/src/LICENSE-CODE).

#### Disclaimer

**THIS SOFTWARE IS PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**
