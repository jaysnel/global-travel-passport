const { ethers } = require("hardhat");

async function main() {
    const [ deployer ] =  await ethers.getSigners();
    const accountBalance = await deployer.getBalance();
    console.log('Deploying contracts with account:', deployer.address);
    console.log('Account Balance:', accountBalance);

    const GlobalPassportFactory = await ethers.getContractFactory('GlobalPassport');
    const GlobalPassportContract = await GlobalPassportFactory.deploy();
    await GlobalPassportContract.deployed();

    console.log('Contract Address:', GlobalPassportContract.address);
}

main()
    .then(() => process.exit(0))
    .catch((err) => {
        console.error(err);
        process.exit(1);
    })