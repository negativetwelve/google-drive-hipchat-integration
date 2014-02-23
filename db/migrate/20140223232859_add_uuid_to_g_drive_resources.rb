class AddUuidToGDriveResources < ActiveRecord::Migration
  def change
    add_column :g_drive_resources, :uuid, :string
  end
end
