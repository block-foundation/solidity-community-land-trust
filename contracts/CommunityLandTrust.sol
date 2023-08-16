// SPDX-License-Identifier: Apache-2.0


// Copyright 2023 Stichting Block Foundation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


pragma solidity ^0.8.19;


// ============================================================================
// Contracts
// ============================================================================
/**
 * @title Community Land Trust Contract
 * @author Lars van Vianen
 * @notice This contract manages a community land trust on the Ethereum blockchain.
 * @dev Each land unit is represented as a unique parcel. Special privileges for trustees 
 * and dynamic pricing are included. Always ensure to test the contract thoroughly 
 * before deploying on a mainnet.
 */
contract CommunityLandTrust {

    // Parameters
    // ========================================================================

    /** @notice Address of the contract owner (usually the community land trust entity).
      * @dev This address holds special privileges, such as withdrawing funds.
      */
    address public owner;

    /** @notice Total land parcels available for purchase from the trust.
      * @dev Value decrements as parcels are sold.
      */
    uint public totalLand;

    /** @notice Current price of a land parcel in ethers.
      * @dev Trustees have the privilege to update this price.
      */
    uint public landPrice;

    /** @notice Counter for generating unique ID for each land parcel.
      * @dev Incremented each time a new land parcel is created.
      */
    uint public nextLandParcelId = 0;

    // Structs
    // ========================================================================

    /** 
     *  @notice Represents a unique land parcel.
     *  @dev Each land parcel has a unique ID and an owner address.
     *  @param id Unique identifier for the land parcel.
     *  @param owner Address of the current owner of the land parcel.
     */
    struct LandParcel {
        uint id;
        address owner;
    }

    // Constructor
    // ========================================================================

    /**
     * @notice Initializes the Community Land Trust contract with initial land and price settings.
     * @dev Sets the sender as the owner of the contract and initial trustee.
     * Also creates unique parcels for each unit of total land.
     * @param _totalLand Initial number of land parcels in the trust.
     * @param _landPrice Initial price of each land parcel in ethers.
     */
    constructor(uint _totalLand, uint _landPrice) {
        owner = msg.sender;
        trustees[owner] = true;
        totalLand = _totalLand;
        landPrice = _landPrice;
        for (uint i = 0; i < _totalLand; i++) {
            landParcels[i] = LandParcel(i, owner);
            landOwners[owner].push(i);
            nextLandParcelId++;
        }
    }

    // Mappings
    // ========================================================================

    /**
     * @notice Represents the mapping of unique land parcel IDs to their respective data.
     * @dev Key is the unique parcel ID, and value is the LandParcel struct.
     */
    mapping(uint => LandParcel) public landParcels;

    /**
     * @notice Represents the mapping of owner addresses to the list of parcel IDs they own.
     * @dev Key is the owner's address, and value is an array of owned parcel IDs.
     */
    mapping(address => uint[]) public landOwners;

    /**
     * @notice Represents the mapping of addresses to their trustee status.
     * @dev Key is the address, and value is a boolean indicating if they are a trustee (true) or not (false).
     */
    mapping(address => bool) public trustees;


    // Events
    // ========================================================================

    /** @notice Emits when a land parcel is purchased by a buyer.
     * @param _buyer Address of the buyer.
     * @param _parcelId ID of the purchased land parcel.
     */
    event Purchase(address indexed _buyer, uint _parcelId);

    /** @notice Emits when a land parcel is sold back to the trust.
     * @param _seller Address of the seller.
     * @param _parcelId ID of the sold land parcel.
     */
    event Sale(address indexed _seller, uint _parcelId);

    /** @notice Emits when a land parcel ownership is transferred between users.
     * @param _from Address of the sender (current owner).
     * @param _to Address of the receiver (new owner).
     * @param _parcelId ID of the transferred land parcel.
     */
    event Transfer(address indexed _from, address indexed _to, uint _parcelId);

    /** @notice Emits when the price of the land parcel is changed.
     * @param _newPrice New price of the land parcel in ethers.
     */
    event PriceChanged(uint _newPrice);

    /** @notice Emits when a new trustee is added.
     * @param _trustee Address of the newly added trustee.
     */
    event TrusteeAdded(address _trustee);

    /** @notice Emits when a trustee is removed.
     * @param _trustee Address of the removed trustee.
     */
    event TrusteeRemoved(address _trustee);


    // Modifiers
    // ========================================================================

    /**
     * @notice Modifier to restrict function execution to the contract owner only.
     * @dev Checks if the message sender is the contract owner before executing the function.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can execute this operation");
        _;
    }

    /**
     * @notice Modifier to restrict function execution to trustees only.
     * @dev Checks if the message sender is a trustee before executing the function.
     */
    modifier onlyTrustees() {
        require(trustees[msg.sender] == true, "Only trustee can execute this operation");
        _;
    }

    // Methods
    // ========================================================================

    /**
     * @notice Allows a user to purchase a land parcel from the trust.
     * @dev The buyer sends Ether to the contract with this function. The function checks if 
     * the correct amount of Ether is sent, if land parcels are available, and assigns a land 
     * parcel to the buyer. An event is emitted after a successful purchase.
     */
    function purchaseLand() public payable {
        require(totalLand > 0, "No land available for purchase");
        require(msg.value == landPrice, "Incorrect Ether sent for the purchase");

        totalLand--;
        LandParcel storage parcel = landParcels[nextLandParcelId - totalLand - 1];
        parcel.owner = msg.sender;

        landOwners[msg.sender].push(parcel.id);
        emit Purchase(msg.sender, parcel.id);
    }
    /**
     * @notice Allows a land parcel owner to sell it back to the trust.
     * @dev The function checks if the caller is indeed the owner of the specified land parcel,
     * then transfers the ownership back to the trust and sends Ether as payment to the seller.
     * @param _parcelId The ID of the land parcel to be sold.
     */
    function sellLand(uint _parcelId) public {
        LandParcel storage parcel = landParcels[_parcelId];
        require(parcel.owner == msg.sender, "You don't own this land parcel");

        parcel.owner = owner;
        totalLand++;

        payable(msg.sender).transfer(landPrice);

        emit Sale(msg.sender, _parcelId);
    }

    /**
     * @notice Allows a land parcel owner to transfer it to another address.
     * @dev The function checks if the caller is the owner of the specified land parcel,
     * then transfers the ownership to the specified address.
     * @param _parcelId The ID of the land parcel to be transferred.
     * @param _to The address to transfer the land parcel to.
     */
    function transferLand(uint _parcelId, address _to) public {
        LandParcel storage parcel = landParcels[_parcelId];
        require(parcel.owner == msg.sender, "You don't own this land parcel");

        parcel.owner = _to;

        emit Transfer(msg.sender, _to, _parcelId);
    }

    /**
     * @notice Fetches the land parcels owned by the specified address.
     * @param _owner The address to query the owned land parcels for.
     * @return An array of land parcel IDs owned by the specified address.
     */
    function getLandParcels(address _owner) public view returns(uint[] memory) {
        return landOwners[_owner];
    }

    /**
     * @notice Allows a trustee to change the land parcel price.
     * @dev The new price is set and an event is emitted.
     * @param _newPrice The new price for land parcels.
     */
    function setLandPrice(uint _newPrice) public onlyTrustees {
        landPrice = _newPrice;
        emit PriceChanged(_newPrice);
    }

    /**
     *  @notice Allows the contract owner to add a new trustee.
     *  @dev The specified address is marked as a trustee and an event is emitted.
     *  @param _newTrustee The address to be added as a trustee.
     */
    function addTrustee(address _newTrustee) public onlyOwner {
        trustees[_newTrustee] = true;
        emit TrusteeAdded(_newTrustee);
    }

    /**
     * @notice Allows the contract owner to remove a trustee.
     * @dev The specified trustee address is revoked and an event is emitted.
     * @param _trustee The address to be removed from trustees.
     */
    function removeTrustee(address _trustee) public onlyOwner {
        trustees[_trustee] = false;
        emit TrusteeRemoved(_trustee);
    }

    /**
     * @notice Allows the contract owner to withdraw all Ethers held by the contract.
     * @dev The balance is transferred to the owner's address.
     */
    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }


}
