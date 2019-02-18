class CreateUniqueDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :unique_donations do |t|
      t.references :user, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
