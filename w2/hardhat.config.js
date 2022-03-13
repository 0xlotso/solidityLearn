require("@nomiclabs/hardhat-waffle");
require('dotenv').config()
// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: {
    version: "0.8.0",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
      outputSelection: {
        "*": {
          "*": [
            "metadata", "evm.bytecode" // Enable the metadata and bytecode outputs of every single contract.
            , "evm.bytecode.sourceMap" // Enable the source map output of every single contract.
            ,"storageLayout"
          ],
          "": [
            "ast" // Enable the AST output of every single file.
          ]
        },
      
      },

    },
  },
  networks: {
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${process.env.INFURA_ID}`,
      // 填写测试账户的私钥，可填写多个   
      accounts: [process.env.KEY1]
    },
  },
};
