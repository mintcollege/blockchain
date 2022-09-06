
Today
========================

Visibility
---------------------

- **public**: Accessible by all and create a view method by default (uses more gas than the rest)
- **private**: Only accessible inside the contract that holds it
- **internal**: (Default) Accessible only in the contract that holds it AND inherits it 
- **external**: NOT accessible in the class or when inherited. Only accessible from outside. (least amount of gas)


Saving data:
------------------------
Terms:
- **On-chain**: To save data to the blockchain
- **Off-chain**: To NOT save data to the blockchain

Before saving data "on-chain", ask if it _needs_ to be saved on-chain. Consider other alternatives first such as saving to:

- Database
- Cookie
- Cache
- File
- etc...

Lessening the amount of data you save on-chain helps keep any gas fees down.