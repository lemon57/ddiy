class AddTitleToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :title, :string
    add_column :jobs, :description, :string
    add_column :jobs, :photo, :string
  end
end
