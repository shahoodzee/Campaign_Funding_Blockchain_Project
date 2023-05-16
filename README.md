# Campaign_Funding_Blockchain_Project
 The code provided in the contracts is  Solidity smart contract named "Simple" that manages a crowdfunding campaign. Here's a breakdown of its key features:

The contract defines a Campaign struct that represents a crowdfunding campaign. It includes fields such as name, description, goal, raised, and campaignID.

The contract uses a mapping called Campaigns to store and retrieve campaign details based on their unique campaignID.

An event named CampaignFunded is defined, which is emitted when a campaign is funded. It includes the campaign ID, name, and the amount funded.

The CampaignsCount variable keeps track of the total number of campaigns created.

The addCampaign function allows adding new campaigns by providing the name, description, fundraising goal, and an initial raised amount. It converts the goal from ether to wei and assigns a unique campaign ID.

The getCampaign function retrieves the details of a specific campaign based on its ID.

The listAllCampaigns function returns an array of all campaigns by iterating through the Campaigns mapping.

The fundCampaign function allows users to contribute funds to a specific campaign by providing the campaign ID. It checks if the campaign ID is valid and if the goal has not been achieved yet. It updates the raised amount and emits the CampaignFunded event.

Overall, this contract provides basic functionality for creating, listing, and funding crowdfunding campaigns. Please note that additional functions, modifiers, or contract logic can be added based on the specific requirements of your application.

#NOTE
The overall project was made in truffle enviroment. SO in order to run this code in truffle. 

1 truffle init - create a new truffle project
2 replace the migrations contracts test folders by the existing folders in this repository
3 Add the html and server.js file in the directory too it will laucnh the User Interface on localhost port 50000
4 to run the UI just type " node server.js "
5 then goto the browser and type http://127.0.0.1:5000
