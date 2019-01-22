class AddCampaignToDonations < ActiveRecord::Migration[5.1]
  def change
    add_reference :donations, :campaign, foreign_key: true
  end
end
