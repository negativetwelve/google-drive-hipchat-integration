class CreateGDriveResources < ActiveRecord::Migration
  def change
    create_table :g_drive_resources do |t|
      t.string :resource_path
      t.references :hipchat_room

      t.timestamps
    end
  end
end
