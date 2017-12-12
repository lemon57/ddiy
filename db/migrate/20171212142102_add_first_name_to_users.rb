class AddFirstNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :loacation, :string
    add_column :users, :phone_number, :string
    add_column :users, :photo, :string
  end
end
