const {expect} = require('chai');



let owner;


describe('Creating my own token', async () => {
    beforeEach(async () => {
        [owner, anna, ben, clare, james, banneduser] = await ethers.getSigners()
        
        const Mintcoin = await ethers.getContractFactory('MintCoin')
        contract = await Mintcoin.deploy()
        
    })
    
    it('Check how many tokens are owned by owner', async () => {
        
        const tokenCount = await contract.getMintCoinBalance();
        expect(tokenCount).equals(1000000000);
    })
    
    it('Test high score', async () => {
        expect(await contract.balanceOf(anna.address)).equals(0);
        await contract.userGetsHighScore(anna.address, 100);
        expect(await contract.balanceOf(anna.address)).equals(100);
    })
})