//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DTTBA {

    uint256 public durianCount = 0;
    uint256 public durianFarmCount = 0;
    uint256 public durianFarmSectorCount = 0;

    Durian[] durians;
    struct Durian {
        uint256 id;
        uint256 weightGrams;
        DurianGrade grade;
        Stage stage;
    }

    enum DurianGrade {
        Extra, 
        ClassI, 
        ClassII
    }
    
    // Timestamps for the four stages
    uint[] stageTimestamps;

    enum Stage {
        Harvested, 
        AtDistributionCenter, 
        AtRetailer, 
        SoldToCustomer, 
        Expired
    }

    enum Rate {
        Worst, 
        Bad, 
        Normal, 
        Good, 
        Excellent
    }

    // Ratings given to this durian by the customers
    rating[] ratings;
    durianFarm public farm; 
    durianTree public tree;

    struct rating {
        Customer ratingCustomer;
        Rate taste;
        Rate fragrance;
        Rate creaminess;
        Rate price; 
    }
    
    struct Customer {
        string id;
        string name;
        address addr;
    }

    struct worker{
        string workerID;
    }

    struct durianFarm{
        string farmID;
        string name;
        string location;
        durianFarmSector[] sectors;
    }

    struct durianFarmSector{
        string farmSectorID;
        uint256 duringTreeCount;
    }

    struct durianTree{
        string treeID;
        durianFarm farm;
        durianFarmSector sector;
        uint age;
        string species;
        uint256 lastHarvestTime;
    }

    address owner;

    constructor() {
        owner = msg.sender;
        stageTimestamps[0] = block.timestamp;
    }

    modifier validStage(Stage reqStage) {
        require(currentStage == reqStage);
        _;
    }

    function addDurianFarm(string memory _farmID, string memory _name, string memory _location) public {

    }
}