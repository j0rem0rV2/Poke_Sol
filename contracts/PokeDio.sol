// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract PokemonGame is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct Pokemon {
        string name;
        string ptype;
        uint256 level;
        uint256 xp;
    }

    mapping(uint256 => Pokemon) public pokemons;

    constructor(address initialOwner)
        ERC721("PokemonNFT", "PKMN")
        Ownable(initialOwner)
    {}

    function mintPokemon(address player, string memory name, string memory ptype) public onlyOwner returns (uint256) {
        _tokenIds.increment();
        uint256 newId = _tokenIds.current();
        _safeMint(player, newId);
        pokemons[newId] = Pokemon(name, ptype, 1, 0);
        return newId;
    }

    function battle(uint256 tokenId) public {
        require(ownerOf(tokenId) == msg.sender, "Voce nao e o dono");

        uint256 gainedXP = _randomXP(tokenId);
        Pokemon storage pkmn = pokemons[tokenId];
        pkmn.xp += gainedXP;

        while (pkmn.xp >= 100) {
            pkmn.level += 1;
            pkmn.xp -= 100;
        }
    }

    function getPokemon(uint256 tokenId) public view returns (Pokemon memory) {
        require(ownerOf(tokenId) != address(0), "Pokemon inexistente");
        return pokemons[tokenId];
    }

    function _randomXP(uint256 tokenId) private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, tokenId, msg.sender))) % 50 + 10;
    }
}
