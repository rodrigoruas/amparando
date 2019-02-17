class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :occupation, :string
    add_column :users, :observation, :text
    add_column :users, :availability, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
