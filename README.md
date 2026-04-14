# Panama Guna Ceremonial Mola Techniques Registry

On-chain registry documenting real, verifiable Guna ceremonial mola textile techniques from Guna Yala, Panama.

This contract records:

- Reverse applique
- Layered applique
- Fine-cut geometric patterning
- Bird, serpent, marine and anthropomorphic motifs
- Color-block composition
- Hand-stitched contouring
- Other documented mola construction methods

Communities include:

- Ustupu
- Ailigandí
- Playón Chico
- Cartí Sugtupu
- Narganá

---

## Contract

Deployed on Base:
`0x38962cc07992097887e74cbd2027c9e39117dd99`

🔗 https://basescan.org/address/0x38962cc07992097887e74cbd2027c9e39117dd99#code

---

## Interface

solidity
recordTechnique(
  string region,
  string community,
  string techniqueName,
  string materialType,
  string culturalNote,
  string ritualUse
);

voteTechnique(uint256 id, bool like);

totalTechniques();

---

## Purpose

This registry preserves documented Guna ceremonial mola textile knowledge and ritual techniques on-chain.
