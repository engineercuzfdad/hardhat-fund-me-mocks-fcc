require("@nomicfoundation/hardhat-toolbox");
require("hardhat-deploy");
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    hardhat: {
      chainId: 31337,
      // gasPrice: 130000000000,
    },
  },

  namedAccounts: {
    deployer: {
      default: 0,
    },
  },

  solidity: {
    compilers: [
      {
        version: "0.8.9",
      },

      {
        version: "0.6.6",
      },
    ],
  },
};
