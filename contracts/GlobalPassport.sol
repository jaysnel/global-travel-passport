//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract GlobalPassport {
    uint256 totalPassportCount;

    event EmitPassportInfo(uint256 id, string identityVerification, int[] previousId, string name, string issued, string expiration, string verifiyer, string dob, string photo, string lastUpdated, string[] citizenship);

    struct PassportInfo {
        uint256 id;
        string identityVerification;
        int[] previousId;
        string name;
        string issued;
        string expiration;
        string verifiyer;
        string dob;
        string photo;
        string lastUpdated;
        type[] citizenship;
    }
    
    PassportInfo[] citizen;
    

    constructor() payable {
        console.log('Global Passport Contract Started.');
    }

    function createNewPassport(uint256 id, string memory identityVerification, int[] memory previousId, string memory name, string memory issued, string memory expiration, string memory verifiyer, string memory dob, string memory photo, string memory lastUpdated, string[] memory citizenship) public {
        citizen.push(PassportInfo(id, identityVerification, previousId, name, issued, expiration, verifiyer, dob, photo, lastUpdated, citizenship));

        emit EmitPassportInfo(id, identityVerification, previousId, name, issued, expiration, verifiyer, dob, photo, lastUpdated, citizenship);
    }

    function updatePassport() public view {
        console.log('Update Passport');
    }

    function getCitizens() public view returns (PassportInfo[] memory){
        return citizen;
    }
}