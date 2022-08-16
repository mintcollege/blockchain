import {sub, add} from "./math/sub.js";
import mul from "./math/sub.js";



const FULLNAME = ['Maria', 'Regina', 'Deleste']
const FULLNAME_OBJ = {
    first: 'Maria',
    second: 'Regina',
    lastname: 'Deleste'
}

let {lastname, first, second} = FULLNAME_OBJ

// let txtname = lastname + ', ' + first + ' ' + second
let txtname = `${lastname}, ${first} ${second}`
// console.log(lastname, first, second)
// console.log(txtname)

// for(let i; i<3; i++) {
//     console.log(i)
// }

// const shownames = (arr) => {
//     for(let name of FULLNAME) {
//         console.log(name)
//     }
// }

// shownames(FULLNAME)

// const first = FULLNAME[0]
// const second = FULLNAME[1]
// const lastname = FULLNAME[2]

// let [lastname] = FULLNAME
// console.log(lastname)

// Rest operator
// const add = (...num) => {
//     let total = 0
//     for(let i of num) {
//         total += i
//     }
//     return total
// }

// Spread operator
let arr = [4, 5, 1, 12, 64, 193]
console.log(add(...arr))

// FULLNAME.push('Lorrine')
// let names = ['Maria', 'Regina', 'Deleste']
// names.push('Lorrine')
// names = [...names, 'Rosales']
// console.log(names)

// // Comments are important
// let names2 = {
//     first: 'Maria',
//     second: 'Regina',
//     lastname: 'Deleste',
//     middle: 'Sam',
// }
// let middle = {
//     middle: 'Rosales'
// }
//
// // Get the legal fullname
// let mergedname = {...names2, ...middle}
// console.log(mergedname)

// console.log(sub(10, 1, 2, 3, 90))
console.log(mul(2, 2, 2))


