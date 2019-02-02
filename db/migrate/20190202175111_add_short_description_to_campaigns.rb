class AddShortDescriptionToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :short_description, :string
  end
end
