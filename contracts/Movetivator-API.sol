// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

/**
 * Request testnet LINK and ETH here: https://faucets.chain.link/
 * Find information on LINK Token Contracts and get the latest ETH and LINK faucets here: https://docs.chain.link/docs/link-token-contracts/
 */

/**
 * THIS IS AN EXAMPLE CONTRACT WHICH USES HARDCODED VALUES FOR CLARITY.
 * PLEASE DO NOT USE THIS CODE IN PRODUCTION.
 */
contract Movetivator is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    uint256 public distance;
    uint256 public time;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    /**
     * Network: Kovan
     * Oracle: 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8 (Chainlink Devrel   
     * Node)
     * Job ID: d5270d1c311941d0b08bead21fea7747
     * Fee: 0.1 LINK
     */
    constructor() {
        setPublicChainlinkToken();
        oracle = 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8;
        jobId = "d5270d1c311941d0b08bead21fea7747";
        fee = 0.1 * 10 ** 18; // (Varies by network and job)
    }
    
    /**
     * Create a Chainlink request to retrieve API response, find the target
     * data, then multiply by 1000000000000000000 (to remove decimal places from data).
     */
    function requestDistanceData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillDistance.selector);
        
        // Set the URL to perform the GET request on
        request.add("get", "https://www.strava.com/api/v3/athletes/42337674/stats?access_token=2b34dfc50fc454ad5f0bd1773a6ce242ac65a495");
        
        // Set the path to find the desired data in the API response, where the response format is:
        // 
        //      {"all_run_totals":
        //          {"distance": xxx.xxx,
        //       }
        //      }
        //
        //    
        request.add("path", "all_run_totals.distance");
        
        // Multiply the result by 1000000000000000000 to remove decimals
        //int timesAmount = 10**18;
        //request.addInt("times", timesAmount);
        
        // Sends the request
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    /*
    * Request time 
    */
    
    function requestTimeData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfillTime.selector);
        
        // Set the URL to perform the GET request on
        request.add("get", "https://www.strava.com/api/v3/athletes/42337674/stats?access_token=2b34dfc50fc454ad5f0bd1773a6ce242ac65a495");
        
        // Set the path to find the desired data in the API response, where the response format is:
        // 
        //      {"all_run_totals":
        //          {"moving_time": xxx.xxx,
        //       }
        //      }
        //
        //    
        request.add("path", "all_run_totals.moving_time");
        
        // Multiply the result by 1000000000000000000 to remove decimals
        //int timesAmount = 10**18;
        //request.addInt("times", timesAmount);
        
        // Sends the request
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    /**
     * Receive the response in the form of uint256
     */ 
    function fulfillDistance(bytes32 _requestId, uint256 _distance) public recordChainlinkFulfillment(_requestId)
    {
        distance = _distance;
    }
    
    function fulfillTime(bytes32 _requestId, uint256 _time) public recordChainlinkFulfillment(_requestId)
    {
        time = _time;
    }

    // function withdrawLink() external {} - Implement a withdraw function to avoid locking your LINK in the contract
    
    function getDistance() public view returns(uint256) {
        return distance;
    }

    function getTime()public view returns(uint256) {
        return time;
    }

   
    // Release Funds
    
    uint256 public pace;
    uint256 mile;
    uint256 minute;
    
    function covertMile() public {
        mile = distance / 1609;
    }
    
    function convertMinute() public {
        minute = time / 60;
    }
mapping(address => uint) balances; // track/increment sender balance/amount
function invest() external payable // external.public uses more gas when used with large arrays of data.
                                   // payable indicates that this contract can accept ETH
{
if (msg.value < 50000000000000000) // a. must be ETH/WEI not $. b. solution for ETH/$ pair price change. 
 revert() ;                     // specifies to revert transaction when bool of IF is true   

balances[msg.sender] += msg.value; // track/ increment sender balance/amount 
}                                   // balances ??
                                   // += increment 
                                   // msg.value = sent amaount
function balanceOf() 
external view returns (uint)       // view enables reading of balances(?)
                                   // return specifies datatype 
{
return address (this).balance;     // this refers to contract
                                   // balance specifies field in contract
}
    uint pace =14;

function withdraw (address payable _address) public  {

if (pace < 15)
{_address.transfer(50000000000000000);}

}
}