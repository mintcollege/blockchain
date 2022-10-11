// const {expect} = require('chai');
//
// // TESTS TO RUN:
//
// // Check if a user has been saved
//
// // THINGS TO DO:
// // Compile contract
// // Deploy the contracts
//
// let owner, anna, ben, clare, james, banneduser, contract
//
// describe('CryptodevsV2 Testing', () => {
//     beforeEach(async () => {
//         // SETUP PROCESS
//         // Get the accounts to access the chain
//         [owner, anna, ben, clare, james, banneduser] = await ethers.getSigners()
//
//         // Deploy contract
//         const ExpenseTracker = await ethers.getContractFactory('ExpenseTracker')
//         contract = await ExpenseTracker.deploy()
//
//         // Have one user be banned
//         await contract.banUser(banneduser.address)
//     })
//
//     it('onlyOwner', async () => {
//         // Check if owner has the correct address
//         expect(await contract.owner()).equals(owner.address)
//
//         // Check if addUser works
//         expect(await contract.idCounter()).equals(0)
//         expect((await contract.users(anna.address)).id).equals(0)
//
//         // Add and test multiple users here
//         let tmpaccounts = [anna, ben, clare]
//         for(let idx in tmpaccounts) {
//             await contract.addUser(tmpaccounts[idx].address)
//             expect((await contract.users(tmpaccounts[idx].address)).id).equals(++idx)
//         }
//
//         // const testIncr() => {
//         //     let num = 0
//         //     // return num++    // returns 0
//         //     return ++num    // returns 1
//         // }
//         // console.log(testInc())
//
//         // Rerun test with new values
//         expect(await contract.idCounter()).equals(3)
//         // expect((await contract.users(anna.address)).id).equals(1)
//         // expect((await contract.users(ben.address)).id).equals(2)
//         // expect((await contract.users(clare.address)).id).equals(3)
//
//         // Check if onlyOwner works
//         await expect(contract.connect(ben).addUser(ben.address)).is.revertedWith('You cannot do that.')
//
//         // Check if the user already exists
//     })
//
//     it.only('Expenses', async () => {
//         // Test for adding expenses
//     })
//
//     it('Banning', async () => {
//         // Test for banning and unbanning of users
//     })
//
// })