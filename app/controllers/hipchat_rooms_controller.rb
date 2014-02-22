class HipchatRoomsController < ApplicationController

  def new
    @hipchat_room = HipchatRoom.new
  end

  def create
    @hipchat_room = HipchatRoom.new(hipchat_room_params)
    if @hipchat_room.save
      redirect_to @hipchat_room
    else
      redirect_to home_path
    end
  end

  private

    def hipchat_room_params
      params.require(:hipchat_room).permit(:name, :api_token, :room_id, :user_id)
    end

end
