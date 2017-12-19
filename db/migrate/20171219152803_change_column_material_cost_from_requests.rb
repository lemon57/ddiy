class ChangeColumnMaterialCostFromRequests < ActiveRecord::Migration[5.0]
  def change
    change_column :requests, :material_cost, :float, :default => 0
  end
end
