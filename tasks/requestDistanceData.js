task("requestDistanceData", "Gets runners total meters run")
  .addParam("contract", "The contract's address")
  .setAction(async (taskArgs) => {
    const contractAddress = taskArgs.contract;
    const Movetivator = await ethers.getContractFactory("Movetivator"); 

    const accounts = await ethers.getSigners();
    const signer = accounts[0];
    const movetivator = await new ethers.Contract(contractAddress, Movetivator.interface, signer);

    await movetivator.requestDistanceData();

    console.log('Request Distance Data sent');
  });

module.exports = {};