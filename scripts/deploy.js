async function main() {
  // We get the contract to deploy
  const Movetivator = await ethers.getContractFactory("Movetivator");
  const movetivator = await Movetivator.deploy();

  console.log("Movetivator deployed to:", movetivator.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });