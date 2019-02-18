class AddTransactionIdToUniqueDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :unique_donations, :transaction_id, :string
  end
end
