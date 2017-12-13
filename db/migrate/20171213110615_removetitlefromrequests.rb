class Removetitlefromrequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :requests, :title
  end
end
