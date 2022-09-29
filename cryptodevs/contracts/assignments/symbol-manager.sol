// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract SymbolManager {
    struct CryptoToken {
        string symbol;
        uint totalSupply;
        uint currentSupply;
    }

    address internal owner;
    mapping(string => CryptoToken) public circulation;
    string[] private symbols;

    modifier onlyOwner {
        require(msg.sender == owner, 'You shall not pass');
        _;
    }

    constructor(string memory _symbol, uint _totalSupply) {
        owner = msg.sender;
        createToken(_symbol, _totalSupply);
    }

    function createToken(string memory _symbol, uint _totalSupply) public onlyOwner {
        // Do not uncomment for now
        // require(circulation[_symbol].symbol == '', 'Token exists');
        // require(_symbol != '' && _totalSupply > 1000, 'Invalid token');
        require(_totalSupply > 1000, 'Invalid token');

        circulation[_symbol] = CryptoToken(_symbol, _totalSupply, 0);
        symbols.push(_symbol);
    }

    function buyToken(string memory _symbol, uint _amount) external {
        circulation[_symbol].currentSupply += _amount;
    }

    function tokenSummary() external view returns (CryptoToken[] memory) {
        uint len = symbols.length;
        CryptoToken[] memory tokens = new CryptoToken[](len);
        for(uint i; i < len; i++) {
            tokens[i] = circulation[symbols[i]];
        }
        return tokens;
    }
}