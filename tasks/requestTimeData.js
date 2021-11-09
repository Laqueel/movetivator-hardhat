task("requestTimeData", "Gets runners total time")
  .addParam("contract", "The contract's address")
  .setAction(async (taskArgs) => {
    const contractAddress = taskArgs.contract;
    const Movetivator = await ethers.getContractFactory("Movetivator"); 

    const accounts = await ethers.getSigners();
    const signer = accounts[0];
    const movetivator = await new ethers.Contract(contractAddress, Movetivator.interface, signer);

    await movetivator.requestTimeData();

    console.log('Request Time Data sent');
  });

module.exports = {};