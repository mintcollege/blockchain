const {expect} = require('chai');



let owner;


describe('Primary testing', async () => {
    beforeEach(async () => {
        [owner, anna, ben, clare, james, banneduser] = await ethers.getSigners()
        
        const Primary = await ethers.getContractFactory('Primary')
        contract = await Primary.deploy('Today is Saturday', 123)
        // await contract.wait();
    })
    
    it('Get the message', async () => {
        // await contract.setMessage('Hello');
        const message = await contract.message();
        expect(message).equals('Today is Saturday')
        
        const age = await contract.age()
        expect(age).equals(123)
        
        expect(await contract.owner()).equals(owner.address)
    })
})