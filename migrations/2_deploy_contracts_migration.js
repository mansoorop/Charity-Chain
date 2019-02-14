var TokenFunc = artifacts.require("./TokenFunc.sol");

module.exports = function(deployer) {
  deployer.deploy(TokenFunc);
};