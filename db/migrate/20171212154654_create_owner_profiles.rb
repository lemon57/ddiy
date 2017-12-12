class CreateOwnerProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :owner_profiles do |t|
      t.references :user, foreign_key: true
      t.integer :verification_status

      t.timestamps
    end
  end
end
