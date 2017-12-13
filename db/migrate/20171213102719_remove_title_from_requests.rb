class RemoveTitleFromRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :requests, :description, :string
    remove_column :requests, :photo, :string
  end
end
