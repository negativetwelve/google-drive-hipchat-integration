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

  private

    def g_drive_resource_params
      params.require(:g_drive_resource).permit(:hipchat_room_id, :resource_path)
    end

end
