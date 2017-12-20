class ChangeColumnPhoto < ActiveRecord::Migration[5.0]
  def change
     change_column :jobs, :photos, :string
  end
end
