const {expect} = require('chai')


/*
* Steps to do
*
* - Write the contract - DONE
* - Get the user which will deploy the contract - DONE
* - Deploy the contract
* - Test the function
*
* */

describe('CryptoDevs contract', () => {
    it('My first message test', async () => {               // Asynchronous function
        
        // const accounts = await ethers.getSigners()          // Asynchronous function
        //
        // for(let account of accounts) {
        //     let funds = await account.getBalance()
        //     funds = ethers.utils.formatEther(funds)
        //
        //     console.log(`${account.address}: ${funds} ETH`)
        // }
        // console.log(accounts)
        
        const [owner, user1, user2] = await ethers.getSigners()
        // console.log(owner.address)
        // console.log(user1.address)
        // console.log(user2.address)
        
        const Message = await ethers.getContractFactory('Message')
        const contract = await Message.deploy()
        // console.log(`Deployed: ${contract.address}`)
        
        // console.log(await contract.helloMessage())
        
        // Unit test
        expect(await contract.helloMessage()).equals('Hello there!')
        expect(await contract.expectFunds(123)).is.true
        expect(await contract.expectFunds(99)).is.false
        expect(await contract.totalFunds()).equals(0)
    })
})