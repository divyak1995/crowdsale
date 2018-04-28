pragma solidity ^0.4.18;

import "zeppelin-solidity-1.5.0/contracts/crowdsale/CappedCrowdsale.sol";
import "zeppelin-solidity-1.5.0/contracts/crowdsale/RefundableCrowdsale.sol";
import "zeppelin-solidity-1.5.0/contracts/token/MintableToken.sol";
import "zeppelin-solidity-1.5.0/contracts/crowdsale/FinalizableCrowdsale.sol";

contract SampleCrowdsaleToken is MintableToken {
string public constant name = "Sample Crowdsale Token";
  string public constant symbol = "SCT";
  uint8 public constant decimals = 18;
}

contract SampleCrowdsale is CappedCrowdsale, RefundableCrowdsale {
function SampleCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, uint256 _goal, uint256 _cap, address _wallet) public
    CappedCrowdsale(_cap)
    FinalizableCrowdsale()
    RefundableCrowdsale(_goal)
    Crowdsale(_startTime, _endTime, _rate, _wallet)
  {
    require(_goal <= _cap);
  }

  function createTokenContract() internal returns (MintableToken) {
    return new SampleCrowdsaleToken();
  }
}