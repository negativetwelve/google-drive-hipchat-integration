class AddResourceIdToGDriveResources < ActiveRecord::Migration
  def change
    add_column :g_drive_resources, :resource_id, :string
  end
end
