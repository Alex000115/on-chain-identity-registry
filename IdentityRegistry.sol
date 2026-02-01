// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract IdentityRegistry is Ownable {
    struct Identity {
        string username;
        string metadataURI; // Link to IPFS or external data
        bool exists;
        uint256 createdAt;
    }

    mapping(address => Identity) private _identities;
    mapping(string => address) private _usernameToAddress;

    event IdentityCreated(address indexed user, string username);
    event IdentityUpdated(address indexed user, string newMetadata);

    constructor() Ownable(msg.sender) {}

    function registerIdentity(
        address _user,
        string calldata _username,
        string calldata _metadataURI
    ) external onlyOwner {
        require(!_identities[_user].exists, "Identity already exists");
        require(_usernameToAddress[_username] == address(0), "Username taken");

        _identities[_user] = Identity({
            username: _username,
            metadataURI: _metadataURI,
            exists: true,
            createdAt: block.timestamp
        });

        _usernameToAddress[_username] = _user;

        emit IdentityCreated(_user, _username);
    }

    function getIdentity(address _user) external view returns (Identity memory) {
        require(_identities[_user].exists, "No identity found");
        return _identities[_user];
    }

    function resolveUsername(string calldata _username) external view returns (address) {
        return _usernameToAddress[_username];
    }
}
