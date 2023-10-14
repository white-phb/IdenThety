const Web3 = require("web3")

const rpcEndpoint = "http://localhost:8545";
const contractAddress = " "

const web3 = new Web3(new Web3.providers.HttpProvider(rpcEndpoint))
const contractAbi = []

const contract =new web3.eth.Contract(contractAbi, contractAddress);

document.getElementById("requestForm").addEventListener("submit", async (event) => {

    event.preventDefault();
    const enodeURL = document.getElementById("enodeURL").ariaValueMax;
    const accounts = await web3.eth.getAccounts();

    try{
        await contract.methods.submitPeerRequest().send({from: accounts[0]})
    }



    
    }

)