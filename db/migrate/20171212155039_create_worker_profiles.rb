class CreateWorkerProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :worker_profiles do |t|
      t.references :user, foreign_key: true
      t.integer :verification_status
      t.string :skill_area
      t.text :bio
      t.integer :price_per_hour
      t.date :dob
      t.boolean :available
      t.time :timetable
      t.integer :completed_tasks
      t.float :rating

      t.timestamps
    end
  end
end
