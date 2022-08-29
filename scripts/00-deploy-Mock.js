const { network } = require("hardhat");
const {
  DECIMALS,
  INITIAL_ANSWER,
  developmentChains,
} = require("../helper-hardhat-config");

module.exports = async ({ deployments, getNamedAccounts }) => {
  const { deploy, log } = deployments;
  const { deployer } = await getNamedAccounts();
  //const chainId = network.config.chainId;

  if (developmentChains.includes(network.name)) {
    log("Local Network detected, Deploying Mocks..!!");
    await deploy("MockV3Aggregator", {
      contract: "MockV3Aggregator",
      from: deployer,
      args: [DECIMALS, INITIAL_ANSWER],
      log: true,
    });
  }
};

module.exports.tags = ["all", "mocks"];
