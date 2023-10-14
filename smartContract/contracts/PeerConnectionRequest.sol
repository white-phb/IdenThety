// contracts/PeerConnectionRequest.sol
pragma solidity ^0.8.0;

contract PeerConnectionRequest {
    address public owner; // Contract owner or administrator
    mapping(address => bool) public peerRequests; // Mapping to track peer connection requests
    address[] public approvedPeers; // List of approved peers

    constructor() {
        owner = msg.sender; // Set the contract owner as the deployer
    }

    function submitPeerRequest() public {
        require(msg.sender != owner, "Contract owner cannot submit a request.");
        peerRequests[msg.sender] = true; // Mark the sender as a requester
    }

    function approvePeerRequest(address requester) public {
        require(msg.sender == owner, "Only the owner can approve requests.");
        require(peerRequests[requester], "Requester has not submitted a request.");
        peerRequests[requester] = false; // Mark the request as approved
        approvedPeers.push(requester); // Add the requester to the list of approved peers
    }

    function getApprovedPeers() public view returns (address[] memory) {
        return approvedPeers;
    }

}
