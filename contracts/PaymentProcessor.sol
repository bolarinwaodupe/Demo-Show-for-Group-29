pragma solidity >=0.4.22 <0.6.0;

// Import contracts for both URBToken,BUSDToken and BEP20.
import "./BEP20.sol";
import "./BUSDToken.sol";

contract PaymentProcessor {

    BUSDToken public busd;
    address public admin;
    
    constructor (BUSDToken _BUSDToken) public{
        busd = _BUSDToken;
        admin = msg.sender; // address of the owner of the contract
    }

    event PaymentEscrowDone(
        address payer,
        uint256 amount,
        uint256 paymentId,
        uint256 date
    );

    event PaymentSellerDone(
        address seller,
        uint256 amount,
        uint256 paymentId,
        uint256 date
    );

    function pay_escrow(uint256 amount, uint256 paymentId) external {
        busd.transferFrom(msg.sender, admin, amount);
        emit PaymentEscrowDone(msg.sender, amount, paymentId, block.timestamp);
    }

    function pay_seller(uint256 amount, uint256 paymentId, address seller) external {
        busd.transferFrom(admin, seller, amount);
        emit PaymentSellerDone(seller, amount, paymentId, block.timestamp);
    }
}