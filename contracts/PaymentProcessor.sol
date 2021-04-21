pragma solidity >=0.4.22 <0.6.0;

import "./BEP20.sol";
import "./URBToken.sol";
import "./BUSDToken.sol";

contract PaymentProcessor {
    address public admin;
    BUSDToken public busd;

    event PaymentEscrowDone(
        address payer,
        uint256 amount,
        uint256 paymentId,
        uint256 date
    );

    event PaymentSellerDone(
        address payer,
        uint256 amount,
        uint256 paymentId,
        uint256 date
    );

    constructor(address adminAddress, address busdAddress) public {
        admin = adminAddress;
        //busd = BUSDToken(busdAddress);
    }

    function pay_escrow(uint256 amount, uint256 paymentId) external {
        busd.transferFrom(msg.sender, admin, amount);
        emit PaymentEscrowDone(msg.sender, amount, paymentId, block.timestamp);
    }

    function pay_seller(uint256 amount, uint256 paymentId) external {
        busd.transferFrom(msg.sender, admin, amount);
        emit PaymentSellerDone(msg.sender, amount, paymentId, block.timestamp);
    }
}