class ChangeStateToBePaidInDonations < ActiveRecord::Migration[5.1]
  def change
    rename_column :donations, :state, :paid
  end
end
