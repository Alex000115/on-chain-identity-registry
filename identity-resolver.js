/**
 * Simple script to resolve an on-chain identity
 */
const { ethers } = require("ethers");

async function lookupUser(contractAddress, userWallet) {
    const abi = [
        "function getIdentity(address) view returns (tuple(string username, string metadataURI, bool exists, uint256 createdAt))"
    ];
    
    // Using a public provider as an example
    const provider = ethers.getDefaultProvider("mainnet");
    const contract = new ethers.Contract(contractAddress, abi, provider);

    try {
        const identity = await contract.getIdentity(userWallet);
        console.log(`Username: ${identity.username}`);
        console.log(`Metadata: ${identity.metadataURI}`);
    } catch (err) {
        console.log("User not registered.");
    }
}
