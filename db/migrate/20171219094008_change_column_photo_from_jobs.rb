class ChangeColumnPhotoFromJobs < ActiveRecord::Migration[5.0]
  def change
    rename_column :jobs, :photo, :photos
    change_column :jobs, :photos, 'json USING CAST(photos AS json)'
  end
end
