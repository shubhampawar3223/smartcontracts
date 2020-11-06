pragma solidity >= 0.5.13 < 0.7.3;

contract charity{
    address owner;
    address payable receiver;
    uint balance;
    bool _isPause;
    
    struct Donor{
        string name;
        bool terms_conditions;
        uint amount;
    }
    
    mapping(address => Donor) public donorLedger;
    
    
    constructor(){
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
     require(msg.sender == owner, "Unauthorized Access!");
     _;
    }
    
    function setReceiver(address _addr) public onlyOwner{
        receiver =payable(_addr);
    }
    
    function registration(string memory _name, bool _terms_condition) public{
        require(_terms_condition == true, "Please Accept,Terms And Conditions first");
        donorLedger[msg.sender].name= _name;
        donorLedger[msg.sender].terms_conditions= _terms_condition;
    }
    
    function recieveEther() payable public{
        balance +=msg.value;
        donorLedger[msg.sender].amount +=msg.value;
        
    }
    
    function donate_to_reciever() public onlyOwner{
        receiver.transfer(balance);
    }
}
