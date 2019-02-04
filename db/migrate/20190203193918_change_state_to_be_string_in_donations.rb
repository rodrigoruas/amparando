class ChangeStateToBeStringInDonations < ActiveRecord::Migration[5.1]
  def change
    change_column :donations, :state, :string
  end
end
