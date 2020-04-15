const Swap = artifacts.require('./web-app/src/contracts/Swap.sol');

module.exports = function (deployer) {
  deployer.deploy(Swap);
};
