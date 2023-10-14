// contracts/PeerConnectionRequest.sol
pragma solidity ^0.8.0;

contract PeerConnectionRequest {
    address public owner;
    mapping(address => bool) public peerRequests;

    constructor() {
        owner = msg.sender;
    }

    function submitPeerRequest() public {
        require(msg.sender != owner, "Contract owner cannot submit a request.");
        peerRequests[msg.sender] = true;
    }

    function approvePeerRequest(address requester) public {
        require(msg.sender == owner, "Only the owner can approve requests.");
        peerRequests[requester] = false;
    }
}
