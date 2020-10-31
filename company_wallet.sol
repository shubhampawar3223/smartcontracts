pragma solidity >= 0.5.13 < 0.7.3;

contract wallet{
    
    address admin;
    uint public balance;
    
    struct employee{
        string name;
        uint password;
        string dept;
        string job_code;
        uint debited;
        uint credited;
    }
    
    mapping(address => employee) public info;
    
    constructor() public{
        admin= msg.sender;
    }
    
    function registerUser(string memory u_name, uint u_password, string memory u_dept, string memory u_job_code ) public{
        info[msg.sender].name= u_name;
        info[msg.sender].password= u_password;
        info[msg.sender].dept= u_dept;
        info[msg.sender].job_code= u_job_code;
    }
    
    modifier login(uint u_password){
        require(info[msg.sender].password== u_password ,"Unauthorized Login");
        _;
    }
    
    function recieveEther() public  payable {
        require(keccak256(abi.encodePacked(info[msg.sender].job_code)) == keccak256(abi.encodePacked("F1")), "Restricted Entry");
    }
    
}
