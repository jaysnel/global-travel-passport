//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract GlobalPassport {
    uint256 totalPassportCount;

    event EmitPassportHolder(uint256 id, string identityVerification, int[] previousIds);

    struct passportHolder {
        uint256 id;
        string identityVerification;
        int[] previousIds;
    }

    passportHolder[] citizen;

    constructor() payable {
        console.log('Global Passport Contract Started.');
    }

    function createNewPassport(uint256 id, string memory identityVerification, int[] memory previousIds) public {
        console.log(id, identityVerification);
        citizen.push(passportHolder(id, identityVerification, previousIds));

        emit EmitPassportHolder(id, identityVerification, previousIds);
    }

    function updatePassport() public view {
        console.log('Update Passport');
    }

    function getCitizens() public view returns (passportHolder[] memory) {
        console.log('Citizens');
    }
}