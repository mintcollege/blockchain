
Prelims
===================


Comments
--------------------

- Collate all Structs and state variables at the top of the contract for easier debugging
- It's better to keep variable names to lowercase unless it's a struct or a contract
- Structs are singular since it represents only one entity

#### Indentation

This is more readable

```solidity
user[id] = User({
    id: id,
    userAddress: userAddress,
    username: username
});
```
than this

```solidity
user[id] = User({
id: id,
userAddress: userAddress,
username: username
});

```

Or even better:

```solidity
user[id] = User(id, userAddres, username);
```

#### Write your code properly

This will **not** pass a _code review_:
```solidity
uint i;
for(i=0;i<expes.length;i++)
{Expense memory a =expes[i];
    if(a.id==id)
   {return(a.mostExpense, a.lessExpense);}
}
```
This will:
```solidity
for(uint i; i < expes.length; i++) {
    Expense memory expense = expes[i];
    if(expense.id == id) {
        return (expense.mostExpense, expense.lessExpense);
    }
}
```


#### Return values:

```solidity
if(_amount >= 10) {
    return "Too expensive";
} 
else if (_amount < 10){
    return "Cheap";
}
```


#### Simplify your logic:

```solidity
// Too long
function isBlocked(uint userID) public returns (bool) {
    if(people[userID].isBlocked == true){
        return true;
    }else{
        return false;
    }
}

// Much better
function isBlocked(uint userID) public returns (bool) {
    return people[userID].isBlocked;
}
```

#### Skip local variables that don't do anything
```solidity
// Instead of this
User memory userDetails = userTrack[userId];
return userDetails;

// Do this
return userTrack[userId];
```


Logic Errors
------------------

#### Total sum v. Total sum per user:

```solidity
// Know the difference between:

// Total sum
uint total;

// Total sum per user
mapping(address => uint) total;
```

#### Unreachable `push()`:
```solidity
function addExpense(uint id, uint _amount) public {
    require(_amount >= 100, "Too cheap");
    require(_amount <= 200, "Too expensive");
    expense[id].push(expenses(_amount));
}
```

#### Unnecessary writing to state
```solidity
function setBlockStatus(address userAdd, bool status) external onlyOwner {
    User memory user = users[userAdd];
    user.isBanned = status;
    users[userAdd] = user;
}
```
