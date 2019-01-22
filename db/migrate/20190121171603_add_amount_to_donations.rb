class AddAmountToDonations < ActiveRecord::Migration[5.1]
  def change
    add_monetize :donations, :amount, currency: { present: false }
  end
end
