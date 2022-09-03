// let age = 24
// const school = 'MINT College'
// console.log(age, school)

// let games = ['Valorant', 'Fortnight', 'COD']
// for(let game in games) {
//     console.log(game)
// }
// for(let i = 0; i < 5; i++) {
//     console.log(i)
// }

// Rest operator
const addnum = (...nums) => {
    let total = 0
    for(let i of nums) {
        total += i
    }
    console.log(total)
}

// Run the function
let numArray = [2, 4, 6, 8, 10, 12, 14]
// Spread operator
addnum(...numArray)
addnum(2, 4, 6, 8, 10, 12, 14)


let array2 = [12, 28, 99]
let combinedArray = [...numArray, ...array2, 423, 111, 895]
console.log(combinedArray)


// const getName = (name, idnumber) => {
//     // string interpolation
//     // return "Samantha's number is " + idnumber
//     return `${name}'s number is ${idnumber}`
// }
// console.log(getName('John', 456))

