class AddTransactionIdToDonations < ActiveRecord::Migration[5.1]
  def change
    add_column :donations, :transaction_id, :string
  end
end
