pragma solidity ^0.4.17;

contract Campaign {
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        
    }
    
    Request[] public requests;
    address public manager;
    uint public minimumContribution;
    address[] public approvers;
    
    modifier restricted() {
        //The sender of this function must be the manager
        require(msg.sender == manager);
        _;
    }
    
    constructor(uint minimum) public {
        manager = msg.sender; 
        minimumContribution = minimum;
    }
    
    //Makes it capable of recieving some money
    function contribute() public payable {
        require(msg.value > minimumContribution);
        
        approvers.push(msg.sender);
    }
    
    function createRequest(string description, uint value, address recipient) 
        public restricted {
            Request memory newRequest = Request({ 
               description: description,
               value: value,
               recipient: recipient,
               complete: false
            });
            
            requests.push(newRequest);
    }
}