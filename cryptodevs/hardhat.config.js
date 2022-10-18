require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  networks: {
    localhost: {
      chainId: 31337,
      accounts: ["private key here"]
    },
    goerli: {
      url: "url here",
      accounts: ["private key here"]
    }
  }
};
