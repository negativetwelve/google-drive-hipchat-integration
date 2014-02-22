class HipchatRoom < ActiveRecord::Base
  belongs_to :user
  has_many :g_drive_resources
end
