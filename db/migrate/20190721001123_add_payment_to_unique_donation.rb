class AddPaymentToUniqueDonation < ActiveRecord::Migration[5.1]
  def change
    add_column :unique_donations, :payment, :jsonb
  end
end
