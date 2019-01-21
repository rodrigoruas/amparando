class ChangeDescriptionToBeTextInCampaigns < ActiveRecord::Migration[5.1]
  def change
    change_column :campaigns, :description, :text
  end
end
