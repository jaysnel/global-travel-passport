//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract GlobalPassport {
    uint256 totalPassportCount;

    event EmitPassportBio(uint256 id, string identityVerification, int[] previousId, string name, string issued, string expiration, string verifiyer, string dob, string photo);
    event EmitPassportInfo(string lastUpdated, string[] citizenship, string[] status, string[] visited);

    struct PassportBio {
        uint256 id;
        string identityVerification;
        int[] previousId;
        string name;
        string issued;
        string expiration;
        string verifiyer;
        string dob;
        string photo;
    }

    struct PassportInfo {
        string lastUpdated;
        string[] citizenship;
        string[] status;
        string[] visited;
    }
    
    PassportBio[] citizenBio;
    PassportInfo[] citizenInfo;
    

    constructor() payable {
        console.log('Global Passport Contract Started.');
    }

    // Passport Bio
    function createPassportBio(uint256 _id, string memory _identityVerification, int[] memory _previousId, string memory _name, string memory _issued, string memory _expiration, string memory _verifiyer, string memory _dob, string memory _photo) public {
        citizenBio.push(PassportBio(_id, _identityVerification, _previousId, _name, _issued, _expiration, _verifiyer, _dob, _photo));
        emit EmitPassportBio(_id, _identityVerification, _previousId, _name, _issued, _expiration, _verifiyer, _dob, _photo);
    }
    function getPassportBio() public view returns (PassportBio[] memory){
        return citizenBio;
    }

    // Passport Info
    function createPassportInfo(string memory _lastUpdated, string[] memory _citizenship, string[] memory _status, string[] memory _visited) public {
        citizenInfo.push(PassportInfo(_lastUpdated, _citizenship, _status, _visited));
        emit EmitPassportInfo(_lastUpdated, _citizenship, _status, _visited);
    }
    function getPassportInfo() public view returns (PassportInfo[] memory){
        return citizenInfo;
    }
}