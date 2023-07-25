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


contract CommunityLandTrust {
    struct LandParcel {
        uint id;
        address owner;
    }

    address public owner;
    uint public totalLand;
    uint public landPrice;
    uint public nextLandParcelId = 0;

    mapping(uint => LandParcel) public landParcels;
    mapping(address => uint[]) public landOwners;
    mapping(address => bool) public trustees;

    event Purchase(address indexed _buyer, uint _parcelId);
    event Sale(address indexed _seller, uint _parcelId);
    event Transfer(address indexed _from, address indexed _to, uint _parcelId);
    event PriceChanged(uint _newPrice);
    event TrusteeAdded(address _trustee);
    event TrusteeRemoved(address _trustee);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can execute this operation");
        _;
    }

    modifier onlyTrustees() {
        require(trustees[msg.sender] == true, "Only trustee can execute this operation");
        _;
    }

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

    function purchaseLand() public payable {
        require(totalLand > 0, "No land available for purchase");
        require(msg.value == landPrice, "Incorrect Ether sent for the purchase");

        totalLand--;
        LandParcel storage parcel = landParcels[nextLandParcelId - totalLand - 1];
        parcel.owner = msg.sender;

        landOwners[msg.sender].push(parcel.id);
        emit Purchase(msg.sender, parcel.id);
    }

    function sellLand(uint _parcelId) public {
        LandParcel storage parcel = landParcels[_parcelId];
        require(parcel.owner == msg.sender, "You don't own this land parcel");

        parcel.owner = owner;
        totalLand++;

        payable(msg.sender).transfer(landPrice);

        emit Sale(msg.sender, _parcelId);
    }

    function transferLand(uint _parcelId, address _to) public {
        LandParcel storage parcel = landParcels[_parcelId];
        require(parcel.owner == msg.sender, "You don't own this land parcel");

        parcel.owner = _to;

        emit Transfer(msg.sender, _to, _parcelId);
    }

    function getLandParcels(address _owner) public view returns(uint[] memory) {
        return landOwners[_owner];
    }

    function setLandPrice(uint _newPrice) public onlyTrustees {
        landPrice = _newPrice;
        emit PriceChanged(_newPrice);
    }

    function addTrustee(address _newTrustee) public onlyOwner {
        trustees[_newTrustee] = true;
        emit TrusteeAdded(_newTrustee);
    }

    function removeTrustee(address _trustee) public onlyOwner {
        trustees[_trustee] = false;
        emit TrusteeRemoved(_trustee);
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}
