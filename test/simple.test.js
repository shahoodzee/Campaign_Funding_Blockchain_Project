const Simple = artifacts.require('Simple');

contract('Simple', (accounts) => {
  let simpleInstance;

  beforeEach(async () => {
    simpleInstance = await Simple.new();
  });

  it('should add a new campaign', async () => {
    const campaignName = 'New Campaign';
    const campaignDesc = 'Campaign description';
    const campaignGoal = 100;
    const initialRaisedAmount = 0;

    const initialCampaignCount = await simpleInstance.CampaignsCount();

    await simpleInstance.addCampaign(campaignName, campaignDesc, campaignGoal, initialRaisedAmount);

    const newCampaignCount = await simpleInstance.CampaignsCount();
    const newCampaign = await simpleInstance.Campaigns(newCampaignCount);

    assert.equal(
      newCampaign.name,
      campaignName,
      'Campaign name does not match'
    );
    assert.equal(
      newCampaign.description,
      campaignDesc,
      'Campaign description does not match'
    );
    assert.equal(
      newCampaign.goal.toString(),
      campaignGoal.toString(),
      'Campaign goal does not match'
    );
    assert.equal(
      newCampaign.raised.toString(),
      initialRaisedAmount.toString(),
      'Initial raised amount does not match'
    );
    assert.equal(
      newCampaign.campaignID.toString(),
      newCampaignCount.toString(),
      'Campaign ID does not match'
    );
    assert.equal(
      newCampaignCount.toString(),
      initialCampaignCount.plus(1).toString(),
      'Campaign count is not incremented correctly'
    );
  });


  
});
