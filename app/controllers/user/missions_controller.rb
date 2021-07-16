class User::MissionsController < ApplicationController
  before_action :authenticate_user!

  def index
   @missions = Mission.where(user_id: current_user.id).includes(:user)
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def new
    @mission = Mission.new
  end
  def create
    @mission = Mission.new(mission_params)
    @mission.user_id = current_user.id
    @mission.save
    redirect_to root_path
  end

  private

  def mission_params
    params.require(:mission).permit(:content, :deadline, :user_id)
  end
end
