class AddAmountToUniqueDonations < ActiveRecord::Migration[5.1]
  def change
    add_monetize :unique_donations, :amount, currency: { present: false }
  end
end
