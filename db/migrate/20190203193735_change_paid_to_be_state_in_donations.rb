class ChangePaidToBeStateInDonations < ActiveRecord::Migration[5.1]
  def change
    rename_column :donations, :paid, :state
  end
end
