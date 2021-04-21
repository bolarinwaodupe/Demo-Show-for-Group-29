pragma solidity >=0.4.22 <0.6.0;

import "./BEP20.sol";

contract BUSDToken is PausableToken, MintableToken {
    // public variables
    string public name = "Binance USD";
    string public symbol = "BUSD";
    uint8 public decimals = 18;

    constructor() public {
        totalSupply_ = 5000000000 * (10 ** uint256(decimals));
    }

    function () external payable {
        revert();
    }
}