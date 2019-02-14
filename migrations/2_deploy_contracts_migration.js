var CharitychainFunc = artifacts.require("./CharityFunc.sol");

module.exports = function(deployer) {
  deployer.deploy(CharitychainFunc);
};