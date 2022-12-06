// WARNING: This is non-functioning code and is only here for display purposes

import {ethers} from "ethers";

// Get the provider
const provider = new ethers.providers.JsonRpcProvider('http://127.0.0.1:8545/')

// Get the accounts in their metamask account
if(!window.ethereum) throw new Error('Install metamask first')
const accounts = await window.ethereum.request({method: 'eth_requestAccounts'})
const account = accounts[0]

// Get the contract to talk to
let contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, provider)
// let contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, signer)

// Call read function
const message = await contract.getMessage()     // Func that exists in the contract
const welcome = await contract.welcomeMessage()

// Get signer
const signer = await provider.getSigner()

// Call write function
contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, signer)
const tx = await contract.setMessage('Get some coffee now.')        // tx is optional
console.log(tx)
