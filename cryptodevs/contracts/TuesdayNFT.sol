// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TuesdayNFT is ERC721, ERC721Burnable, Ownable {
    constructor() ERC721("TuesdayNFT", "TNFT") {
        _safeMint(_msgSender(), 1);
        _safeMint(_msgSender(), 2);
        _safeMint(_msgSender(), 3);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmTWfpQPYe4CWtMhpAyyKZreo8g3BzxkPpfwrnCTHSJJHn/";
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}