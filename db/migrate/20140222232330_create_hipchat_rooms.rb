class CreateHipchatRooms < ActiveRecord::Migration
  def change
    create_table :hipchat_rooms do |t|
      t.string :name
      t.string :api_token
      t.integer :room_id

      t.timestamps
    end
  end
end
