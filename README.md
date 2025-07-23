# 🎮 PokemonGame ERC721 NFT

Contrato inteligente em Solidity que implementa NFTs estilo Pokémon com lógica de minigame integrada. Cada NFT representa um Pokémon que pode batalhar, ganhar experiência (XP) e subir de nível.

## ⚙️ Funcionalidades

- Mint de NFTs personalizados com nome, tipo, nível e XP.
- Batalhas para ganhar XP e evoluir o Pokémon.
- Controle de acesso com `Ownable`: apenas o dono do contrato pode mintar.
- Estrutura compatível com padrão ERC721 (OpenZeppelin).

## 📦 Tecnologias

- Solidity ^0.8.20
- OpenZeppelin Contracts (ERC721, Ownable, Counters)

## 🧪 Exemplo de Uso

```solidity
// Mint de um novo Pokémon
mintPokemon(player, "Charmander", "Fogo");

// Batalha (ganha XP aleatório e sobe de nível)
battle(tokenId);

// Consultar dados do Pokémon
getPokemon(tokenId);
```

## 🚀 Deploy

### Via Remix

1. Compile com versão 0.8.20.
2. Informe seu endereço como `initialOwner` ao deployar.

## 📁 Estrutura da NFT

```solidity
struct Pokemon {
    string name;     // Ex: "Pikachu"
    string ptype;    // Ex: "Eletrico"
    uint256 level;   // Ex: 5
    uint256 xp;      // Ex: 130
}
```

## 🔐 Segurança

- Apenas o dono do contrato pode mintar novos NFTs.
- Lógica de batalha só pode ser executada pelo dono do NFT.
