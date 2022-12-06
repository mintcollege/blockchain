import React, {useEffect, useState} from 'react'
import 'bootstrap/dist/css/bootstrap.min.css'
import './App.css';

import {BigNumber, ethers} from "ethers";


function App() {
    // TERMS:
    // 1. Provider: Connect to the chain/network (read) - CHECK
    // 2 User account: The account with the funds
    // 3. Signer: Create transactions (write)
    // 4. Contract: Call contract functions
    
    const CONTRACT_ADDRESS = '0x610178dA211FEF7D417bC0e6FeD39F05609AD788'
    const ABI = [
        'function getMessage() view returns (string)',
        'function welcomeMessage() pure returns (string)',
        'function setMessage(string _message)',
    ]

    const [provider, setProvider] = useState()
    const [account, setAccount] = useState()
    const [balance, setBalance] = useState(BigNumber.from(0))

    // When the app opens the first time
    useEffect(() => {
        const prov = new ethers.providers.JsonRpcProvider('http://127.0.0.1:8545/')
        setProvider(prov)
    }, [])

    // When an account is set
    useEffect(() => {
        (async () => {
            await _updateBalance()
        })()
    }, [account])

    const _updateAccount = async () => {
        const accounts = await window.ethereum.request({method: 'eth_requestAccounts'})
        await setAccount(accounts[0])
    }

    const _updateBalance = async () => {
        if(!provider || !account) return
        const bal = await provider.getBalance(account)
        setBalance(bal)
    }

    if(!window.ethereum) throw new Error('Please install metamask first')

    window.ethereum.on('accountsChanged', async () => {
        await _updateAccount()
    })

    const connectWallet = async () => {
        await _updateAccount()
    }

    const getMessage = async () => {
        const contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, provider)
        const message = await contract.getMessage()
        console.log(message)
        // const welcome = await contract.welcomeMessage()
        // console.log(welcome)
    }

    const setMessage = async () => {
        const signer = await provider.getSigner()
        const contract = new ethers.Contract(CONTRACT_ADDRESS, ABI, signer)
        const tx = await contract.setMessage('Get some coffee now.')
        console.log(tx)
        await _updateBalance()
        console.log('Message has been changed')
    }

    return (
        <div className="App">

            {(!provider || !account) && (
                <section>
                    <button className={'btn btn-primary'} onClick={connectWallet}>Connect account</button>
                </section>
            )}

            <section>
                <div><strong>Address:</strong> {account || ''}</div>
                <div><strong>Balance: {ethers.utils.formatEther(balance)}</strong></div>
            </section>

            {(provider && account) && (
                <>
                    <section>
                        <button className={'btn btn-secondary'} onClick={getMessage}>Get message</button>
                    </section>
                    
                    <section>
                        <button className={'btn btn-secondary'} onClick={setMessage}>Change message</button>
                    </section>
                </>
            )}
        </div>
    );
}



export default App;
