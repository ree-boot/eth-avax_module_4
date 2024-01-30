require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");
 
const PRIVATE_KEY = "PRIVATEKEY";
 
module.exports = {
    solidity: "0.8.20",
    defaultNetwork: "fuji",
    networks: {
      mainnet: {
        url: `https://api.avax.network/ext/bc/C/rpc`,
        accounts: [PRIVATE_KEY]
      },
      fuji: {
        url: `https://api.avax-test.network/ext/bc/C/rpc`,
        accounts: [PRIVATE_KEY]
      }
    },
    etherscan: {
      apiKey: {
        fuji: "avascan" // apiKey is not required, just set a placeholder
      },
      customChains: [
        {
          network: "fuji",
          chainId: 43113,
          urls: {
            apiURL: "https://api.avascan.info/v2/network/testnet/evm/43113/etherscan",
            browserURL: "https://testnet.avascan.info/blockchain/c"
          }
        }
      ]
    },
};