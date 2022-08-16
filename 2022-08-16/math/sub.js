


export const sub = (start, ...nums) => {
    for(let i of nums) {
        start -= i
    }
    return start
}

export const add = (...num) => {
    let total = 0
    for(let i of num) {
        total += i
    }
    return total
}

const mul = (start, ...num) => {
    for(let i of num) {
        start *= i
    }
    return start
}

export default mul