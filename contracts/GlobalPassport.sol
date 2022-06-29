//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract GlobalPassport {
    uint256 totalPassportCount;

    event EmitPassportData(string[] citizenBio, string[] citizenInfo);


    struct PassportData {
        string[] citizenBio;
        string[] citizenInfo;
    }

    PassportData[] citizen;
    

    constructor() payable {
        console.log('Global Passport Contract Started.');
    }

    function createNewPassport(string[] memory _citizenBio, string[] memory _citizenInfo) public {
        citizen.push(PassportData(_citizenBio, _citizenInfo));
        emit EmitPassportData(_citizenBio, _citizenInfo);
    }

    function getCitizen() public view returns (PassportData[] memory){
        return citizen;
    }
}