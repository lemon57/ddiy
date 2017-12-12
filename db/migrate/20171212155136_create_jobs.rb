class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.references :owner_profile, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
