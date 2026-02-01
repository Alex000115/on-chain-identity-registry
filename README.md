# On-Chain Identity Registry

This repository implements a basic Decentralized Identity (DID) system on the blockchain. It uses the concept of Soulbound Tokens—attributes that are tied to a specific wallet and cannot be sold or moved to another address.

## Core Features
* **Non-Transferable:** Identity records are permanent and tied to the owner's address.
* **Metadata Linking:** Store IPFS hashes or strings representing user profiles.
* **Verification Logic:** Includes an "Authorized Issuer" role to simulate verified identity providers.

## The Identity Flow
1. **Request:** A user submits their profile data.
2. **Attestation:** An authorized admin verifies and "mints" the identity record.
3. **Resolve:** Any dApp can query the contract to get the verified data for a specific address.



## Use Cases
* Sybil resistance for DAOs.
* On-chain resumes and achievement tracking.
* Verified social profiles for Web3 applications.
