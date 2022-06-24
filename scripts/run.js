async function main() {
    const GlobalPassport = await hre.ethers.getContractFactory("GlobalPassport");
    const globalPassportContract = await GlobalPassport.deploy();
    
    await globalPassportContract.deployed();

    console.log("GlobalPassport deployed to: ", globalPassportContract.address);

    await globalPassportContract.getTotalPassportCount();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });