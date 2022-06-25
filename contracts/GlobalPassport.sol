//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract GlobalPassport {
    uint256 totalPassportCount;

    event EmitPassportHolderBio(uint256 id, string identityVerification, int[] previousId);

    struct PassportHolderBio {
        uint256 id;
        string identityVerification;
        int[] previousId;
    }
    
    PassportHolderBio[] citizenBio;
    

    constructor() payable {
        console.log('Global Passport Contract Started.');
    }

    function createNewPassport(uint256 id, string memory identityVerification, int[] memory previousId) public {
        citizenBio.push(PassportHolderBio(id, identityVerification, previousId));

        emit EmitPassportHolderBio(id, identityVerification, previousId);
    }

    function updatePassport() public view {
        console.log('Update Passport');
    }

    function getCitizens() public view returns (PassportHolderBio[] memory){
        return citizenBio;
    }
}