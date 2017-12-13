class Renameloacation < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :loacation, :location
  end
end
