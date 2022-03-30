//SPDX-License-Idenfier: MIT

pragma solidity ^0.8.0;

contract WhiteList {
//always have a max number of people whitelisted
    uint8 public maxWhitelistedAddresses;

//keep track of the number of address in the whitelist
    uint8 public numAddressesWhitelisted;

//give the mapping address and whether their are true or false, whenever the address have access to it or not. better to have a mapping than array for the whitelist
    mapping(address => bool) public whitelistedAddresses;


    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;

    }

    function addAddressToWhitelist() public {
        // if the user address is already on the whitelist, the function stops since the address is already there, if he isnt then its fine and the function continues
        require(!whitelistedAddresses[msg.sender], "Sender already in the whitelist");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;

    }
}