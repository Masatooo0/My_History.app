class User::MissionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @mission = Mission.new
  end
  def create
    @mission = Mission.new(mission_params)
    @mission.user_id = current_user.id
    @mission.save
    redirect_to root_path
  end
  def show
    @mission = Mission.find(params[:id])
  end
  def index
   @missions = Mission.all
  end




  private
  def mission_params
    params.require(:mission).permit(:content, :deadline, :user_id)
  end
end
