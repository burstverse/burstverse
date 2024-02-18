// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BPP is ERC721, Ownable {
    uint256 public mintStartBlock;
    uint256 public mintEndBlock;
    uint256 private _nextTokenId;
    // Base token URI used as a prefix by tokenURI().
    string public baseTokenURI;


    constructor() ERC721("Burstverse Priority Pass", "BPP") Ownable() {
        baseTokenURI = "";
        _nextTokenId = 1;
    }

    function setblock( uint256 _mintStartBlock, uint256 _mintEndBlock ) public onlyOwner {
        mintStartBlock = _mintStartBlock;
        mintEndBlock = _mintEndBlock;
    } 

    function mintToken() public onlyOwner{
        uint256 tokenId = _nextTokenId++;
        _mint(msg.sender, tokenId);
    }

    // Returns an URI for a given token ID
    function _baseURI() internal view virtual override returns (string memory) {
        return baseTokenURI;
    }

    // Sets the base token URI prefix.
    function setBaseTokenURI(string memory _baseTokenURI) public onlyOwner {
        baseTokenURI = _baseTokenURI;
    }

}