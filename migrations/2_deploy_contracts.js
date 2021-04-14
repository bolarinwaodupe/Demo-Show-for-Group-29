const UrblongToken = artifacts.require("UrblongToken.sol");
const PaymentProcessor = artifacts.require("PaymentProcessor.sol");

module.exports = async function (deployer, network, addresses) {
  const [admin, payer, _] = addresses;

  if(network === "develop") {
    await deployer.deploy(UrblongToken);
    const urb = await UrblongToken.deployed();
    await urb.transfer(payer, web3.utils.toWei("10000"));

    await deployer.deploy(PaymentProcessor, admin, urb.address);

  } else {
    const ADMIN_ADDRESS = '';
    const URB_ADDRESS = '';
    await deployer.deploy(UrblongToken);
  }

};
