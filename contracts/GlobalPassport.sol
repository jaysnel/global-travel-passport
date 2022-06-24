//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract GlobalPassport {
    uint256 totalPassportCount;

    constructor() payable {
        console.log('Global Passport Contract Started.');
    }

    function createNewPassport() public view {
        console.log('Creating New Passport');
    }

    function updatePassport() public view {
        console.log('Update Passport');
    }

    function getTotalPassportCount() public view {
        console.log('Passport Count', totalPassportCount);
    }
}