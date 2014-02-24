class GDriveResourcesController < ApplicationController
  protect_from_forgery except: :notification

  def new
    @resource = GDriveResource.new
  end

  def create
    @resource = GDriveResource.new(g_drive_resource_params)
    @resource.uuid = SecureRandom.uuid
    if @resource.save
      redirect_to @resource
    else
      redirect_to home_path
    end
  end

  def show
    @resource = GDriveResource.find(params[:id])
  end

  def watch
    @resource = GDriveResource.find(params[:id])
    params[:resource] = "18BJCrSclefptfkAiZlYZlMpdV-AYcVIpiIuKywDyKWM"
    params[:resource] = "0B9RMkUtrwoqXQllnbHk3YzRqZjg"
    url = "https://www.googleapis.com/drive/v2/files/#{@resource.resource_path}/watch"
    puts url
    body = {
      "id" => @resource.uuid,
      "type" => "web_hook",
      "address" => "https://drivechat.herokuapp.com/resources/notification"
    }.to_json
    response = HTTParty.post(url, :headers => {"Authorization" => "OAuth #{current_user.auth_token}", 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, body: body)
    puts "RESPONSE:"
    puts response
    redirect_to root_path
  end

  def notification
    request.headers.each do |header|
      puts header[0]
      puts header[1]
    end

#    @resource = GDriveResource.find_by_uuid(params[:uuid])
#    @hipchat_room = @resource.hipchat_room
#    hipchat_api = HipChat::API.new(@hipchat_room.api_token)
#    room_id = @hipchat_room.room_id

#    title = "File was updated: #{@resource.resource_path}"
#    hipchat_api.rooms_message(room_id, 'Google Drive', title, notify=1, color='orange', message_format='html')

    redirect_to root_path
  end

  private

    def g_drive_resource_params
      params.require(:g_drive_resource).permit(:hipchat_room_id, :resource_path)
    end

end
