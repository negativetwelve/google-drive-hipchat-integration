class AddUserIdToHipchatRoom < ActiveRecord::Migration
  def change
    add_column :hipchat_rooms, :user_id, :integer
  end
end
