class GDriveResourcesController < ApplicationController

  def new
    @resource = GDriveResource.new
  end

  def create
    @resource = GDriveResource.new(g_drive_resource_params)
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
    params[:resource] = "18BJCrSclefptfkAiZlYZlMpdV-AYcVIpiIuKywDyKWM"
    url = "https://www.googleapis.com/drive/v2/files/#{params[:resource]}/watch"
    response = HTTParty.post(url, :headers => {"Authorization" => "OAuth #{current_user.auth_token}"})
    puts "RESPONSE:"
    puts response
    redirect_to root_path
  end

  private

    def g_drive_resource_params
      params.require(:g_drive_resource).permit(:hipchat_room_id, :resource_path)
    end

end
