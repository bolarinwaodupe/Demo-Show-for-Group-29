pragma solidity >=0.4.22 <0.6.0;

import "./BEP20.sol";

contract URBToken is PausableToken, MintableToken {
    // public variables
    string public name = "Urblong";
    string public symbol = "URB";
    uint8 public decimals = 18;

    constructor() public {
        totalSupply_ = 1000000 * (10 ** uint256(decimals));
    }

    function () external payable {
        revert();
    }
}