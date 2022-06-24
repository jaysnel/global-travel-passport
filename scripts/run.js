async function main() {
    const GlobalPassport = await hre.ethers.getContractFactory("GlobalPassport");
    const globalPassportContract = await GlobalPassport.deploy();
    
    await globalPassportContract.deployed();

    console.log("GlobalPassport deployed to: ", globalPassportContract.address);

  //   const person =  {
  //     id: '00002', // passport/id number
  //     identityVerification: [{
  //         type: '000',
  //         verification: 'asdf90903r356330)(($' // encrypted bit of info tied to indivdual. Maybe biological. Or maybe dont even need
  //     }],
  //     previousId: [ // assuming when you get new passport or renew, you get a different number
  //         '00002',
  //         '00001'
  //     ],
  //     name: 'Jaylan Snelson',
  //     issued: timestamp,
  //     expiration: `${timestamp} + 10years`,
  //     verifiyer: 'USA-USPS-12356abcd', // ID of entity that did original verification when signing up the first time
  //     dob: '1/24/1994',
  //     photo: 'asdfac.png',
  //     lastUpdated: timestamp,
  //     citizen: [
  //         {
  //             country: 'United States',
  //             signature: 'USA-123456', // global country code known to everyone
  //             date: timestamp
  //         },
  //         {
  //             country: 'Colombia',
  //             signature: 'COL-123456', // global country code known to everyone
  //             date: timestamp
  //         },
  //     ],
  //     status: [{
  //         verified: true,
  //         wanted: false
  //     }],
  //     visited: [
  //         {
  //             country: 'colombia',
  //             dateStart: timestamp,
  //             dateEnd: timestamp,
  //             countrySignature: 'CO123456' // mix of country code, employee id?
  //         }
  //     ]
  // }

    await globalPassportContract.createNewPassport(1234, 'asdf90903r356330)(($', [
      {country: 'United States', signature: 'USA-123456', date: 'timestamp'},
      {country: 'Colombia',signature: 'COL-123456', date: 'timestamp'}
      ]);
    await globalPassportContract.getCitizens();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });