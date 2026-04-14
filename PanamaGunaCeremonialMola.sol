// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

contract PanamaGunaCeremonialMola {

    struct MolaTechnique {
        string region;        // Guna Yala
        string community;     // Ustupu, Ailigandi, Playon Chico, Carti Sugtupu, etc.
        string techniqueName; // reverse applique, layered applique, fine-cut geometric, etc.
        string materialType;  // cotton fabric, layered cloth, natural dyes
        string culturalNote;  // ethnographic or archaeological fact
        string ritualUse;     // documented ceremonial or symbolic use
        address creator;
        uint256 likes;
        uint256 dislikes;
        uint256 createdAt;
    }

    MolaTechnique[] public techniques;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event TechniqueRecorded(
        uint256 indexed id,
        string techniqueName,
        string community,
        address indexed creator
    );

    event TechniqueVoted(
        uint256 indexed id,
        bool like,
        uint256 likes,
        uint256 dislikes
    );

    constructor() {
        techniques.push(
            MolaTechnique({
                region: "Guna Yala",
                community: "ExampleCommunity",
                techniqueName: "Example Technique (replace with real entries)",
                materialType: "example material",
                culturalNote: "This is an example entry to illustrate the format.",
                ritualUse: "Real entries should describe documented ceremonial use.",
                creator: address(0),
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordTechnique(
        string calldata region,
        string calldata community,
        string calldata techniqueName,
        string calldata materialType,
        string calldata culturalNote,
        string calldata ritualUse
    ) external {
        require(bytes(region).length > 0, "Region required");
        require(bytes(community).length > 0, "Community required");
        require(bytes(techniqueName).length > 0, "Technique name required");

        techniques.push(
            MolaTechnique({
                region: region,
                community: community,
                techniqueName: techniqueName,
                materialType: materialType,
                culturalNote: culturalNote,
                ritualUse: ritualUse,
                creator: msg.sender,
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );

        emit TechniqueRecorded(
            techniques.length - 1,
            techniqueName,
            community,
            msg.sender
        );
    }

    function voteTechnique(uint256 id, bool like) external {
        require(id < techniques.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        MolaTechnique storage t = techniques[id];

        if (like) {
            t.likes += 1;
        } else {
            t.dislikes += 1;
        }

        emit TechniqueVoted(id, like, t.likes, t.dislikes);
    }

    function totalTechniques() external view returns (uint256) {
        return techniques.length;
    }
}
