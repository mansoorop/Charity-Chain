pragma solidity >=0.5.0;

import "./TokenFunc.sol";

contract CharityFunc is Token  {
    
    address payable owner;
    struct godPeople {
        string name;
        string password;
        string emailId;
        address payable godAdd;
        bytes1 key;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    event regCheck(address payable _userAdd);
    event regSuccess(address payable _userAdd,string _name);
    
    mapping(address => godPeople) userDonation;
    
    function userDetails(string memory _name,string memory _password,string memory _emailId) public {
        
        emit regCheck(msg.sender);
        
        //require(userDonation[msg.sender].godAdd != msg.sender,"User already registered");
        
        userDonation[msg.sender].name = _name;
        userDonation[msg.sender].password = _password;
        userDonation[msg.sender].emailId = _emailId;
        userDonation[msg.sender].godAdd = msg.sender;
        userDonation[msg.sender].key = 'u';
        
        
        emit regSuccess(msg.sender,_name);
    }
    
    function charityDetails(string memory _name,string memory _password,string memory _emailId) public {
        
        userDonation[msg.sender].name = _name;
        userDonation[msg.sender].password = _password;
        userDonation[msg.sender].emailId = _emailId;
        userDonation[msg.sender].godAdd = msg.sender;
        userDonation[msg.sender].key = 'c';
        
        emit regSuccess(msg.sender,_name);
    }
    
    mapping(address => uint256) requestToken;
    
    function userTokenRequest(uint256 _token) public {
        requestToken[msg.sender] = _token;
    }
    
    function userApproval(address payable _userIn) payable public onlyOwner {
        transfer(_userIn,requestToken[_userIn]);
    }
}