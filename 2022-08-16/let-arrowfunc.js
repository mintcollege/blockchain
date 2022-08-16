
const SITENAME = 'Google'

function foo(name='Regine', age=23) {
    // let name = 'John'
    return [name, age]
}

const bar = (name='Regine', age=23) => {
    return [name, age]
}

const bar2 = name => {
    return name
}

const bar3 = name => 'Mike'

console.log(bar3('Regine3'))