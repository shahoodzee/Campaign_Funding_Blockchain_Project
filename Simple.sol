//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.7;
contract Simple {

    // Model a Campaign
    struct Campaign {
        string name;
        string description;
        uint goal;
        uint raised;
        uint campaignID;
    }

    // Read/write Campaigns
    mapping(uint => Campaign) public Campaigns;

    // Event emitted when a campaign is funded
    event CampaignFunded(uint campaignID ,string name, uint fundedAmount);
    
    uint public CampaignsCount = 0;

    // Next, let's create a function to add campaigns 
    function addCampaign(string memory name, string memory desc, uint goal, uint raised) public {
        CampaignsCount++;
        raised = 0;
        uint c_ID = CampaignsCount;
        // Convert goal from ether to wei
        goal = goal * 1 ether;
        Campaigns[CampaignsCount] = Campaign(name, desc, goal, raised, c_ID);
    }

    // Function to get a campaign by ID
    function getCampaign(uint id) public view returns (Campaign memory) {
        require(id > 0 && id <= CampaignsCount, "Invalid campaign ID");
        return Campaigns[id];
    }

    // Function to list all campaigns
    function listAllCampaigns() public view returns (Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](CampaignsCount);
        
        for (uint i = 1; i <= CampaignsCount; i++) {
            allCampaigns[i - 1] = Campaigns[i];
        }
        
        return allCampaigns;
    }
    // Function to fund a campaign
    function fundCampaign(uint campaignID) public payable {
        require(campaignID > 0 && campaignID <= CampaignsCount, "Invalid campaign ID");

        Campaign storage campaign = Campaigns[campaignID];

        require(campaign.raised < campaign.goal, "Campaign goal already achieved");

        campaign.raised += msg.value;

        emit CampaignFunded(campaignID, campaign.name, campaign.raised);
    } 

    constructor()
    {
    }





}
