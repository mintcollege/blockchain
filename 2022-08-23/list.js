
// Code has to be readable



// console.log(todolist)

// +0000 - UTC
// +0800 - Philippines
// console.log(new Date().toISOString())


let todolist = []

const add_todo = todo => todolist.push(todo)

const mark_done = (todoid) => {
    for (let items of todolist) {
        if(items.id === todoid) {
            items.done = true
            items.updated = new Date().toISOString()
        }
    }
}

const all_done = () => {
    for (let item of todolist) {
        if(!item.done) {
            mark_done(item.id)
        }
    }
}

const remove_todo = () => {
    // Placeholder
}

console.log(todolist)
add_todo({
    id: 1,
    todo: "Get groceries",
    done: false,     // boolean
    updated: null
})
add_todo({
    id: 2,
    todo: "Buy fruits at market",
    done: false,
    updated: null
})
add_todo({
    id: 3,
    todo: "Go to bank",
    done: false,
    updated: null
})
add_todo({
    id: 4,
    todo: "Cook dinner",
    done: false,
    updated: null
})
add_todo({
    id: 5,
    todo: "Do homework",
    done: false,
    updated: null
})
mark_done(4)
mark_done(1)
console.log(todolist)

all_done()
console.log(todolist)
