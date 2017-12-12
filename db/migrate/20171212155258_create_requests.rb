class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :description
      t.string :status
      t.references :job, foreign_key: true
      t.references :worker_profile, foreign_key: true
      t.float :hours
      t.time :start_time
      t.float :material_cost
      t.timestamp :time
      t.string :photo

      t.timestamps
    end
  end
end
