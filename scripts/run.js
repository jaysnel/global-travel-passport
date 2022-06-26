async function main() {
    const GlobalPassport = await hre.ethers.getContractFactory("GlobalPassport");
    const globalPassportContract = await GlobalPassport.deploy();
    const bigNumberToNumber = (bigNumber) => {
      return ethers.BigNumber.from(bigNumber).toNumber()
    }
    const date = new Date();
    const day = date.getDay();
    const month = date.getMonth();
    const year = date.getFullYear();
    const timestamp = `${month}/${day}/${year}`
    const expired = `${month}/${day}/${year + 10}`
    
    await globalPassportContract.deployed();

    console.log("GlobalPassport deployed to: ", globalPassportContract.address);

    const person =  {
      id: 1007, // passport/id number
      identityVerification: '123456',
      previousId: [ // assuming when you get new passport or renew, you get a different number
      1234, 7890
      ],
      name: 'Jaylan Snelson',
      issued: timestamp,
      expiration: expired,
      verifiyer: 'USA-USPS-12356abcd', // ID of entity that did original verification when signing up the first time
      dob: '1/24/1994',
      photo: 'asdfac.png', // maybe needs to be formated in a different way
      lastUpdated: timestamp,
      citizenship: [
        '{ "country": "United States", "signature": "USA-123456", "date": "timestamp" }',
        '{ "country": "Colombia", "signature": "COL-123456", "date": "timestamp" }',
    ],
      status: ['{ "verified": true, "wanted": false }'],
      visited: ['{ country: "colombia", dateStart: timestamp, dateEnd: timestamp, countrySignature: "CO123456" }']
  }

    await globalPassportContract.createPassportBio(
      person.id, 
      person.identityVerification, 
      person.previousId, 
      person.name, 
      person.issued, 
      person.expiration, 
      person.verifiyer,
      person.dob,
      person.photo)
    const citizenBio = await globalPassportContract.getPassportBio();
    console.log(await citizenBio)

    await globalPassportContract.createPassportInfo(
      person.lastUpdated,
      person.citizenship,
      person.status,
      person.visited
    )
    const citizenInfo = await globalPassportContract.getPassportInfo();
    console.log(await citizenInfo)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });