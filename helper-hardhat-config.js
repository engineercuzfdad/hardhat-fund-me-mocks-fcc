const networkConfig = {
  420: {
    name: "Goerli testnet",
    ethUSdPrice: "0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e",
  },
  137: {
    name: "Polygon testnet",
    ethUSdPrice: "0xF9680D99D6C9589e2a93a78A04A279e509205945",
  },
  /*31337: {
    name: "Localhost",
  },*/
};

const developmentChains = ["hardhat", "localhost"];

const DECIMALS = 8;
const INITIAL_ANSWER = 200000000000;

module.exports = {
  networkConfig,
  developmentChains,
  DECIMALS,
  INITIAL_ANSWER,
};
