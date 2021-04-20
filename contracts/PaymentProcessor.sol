pragma solidity >=0.4.22 <0.9.0;

contract PaymentProcessor {
    address public admin;
    UrblongToken public urb;

    event PaymentDone(
        address payer,
        uint256 amount,
        uint256 paymentId,
        uint256 date
    );

    constructor(address adminAddress, address urbAddress) public {
        admin = adminAddress;
        urb = UrblongToken(urbAddress);
    }

    function pay(uint256 amount, uint256 paymentId) external {
        urb.transferFrom(msg.sender, admin, amount);
        emit PaymentDone(msg.sender, amount, paymentId, block.timestamp);
    }
}