class User::MissionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @missions = Mission.where(user_id: current_user.id).includes(:user)
    # チャート用データ
    @completed = @missions.where(status: 0)
    gon.completed = @completed.count
    gon.allmissions = @missions.count
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
    if @mission.save
      flash[:success] = '保存しました'
      redirect_to mission_path(@mission.id)
    else
      render 'new'
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    @mission.user_id = current_user.id
    if @mission.update(mission_params)
      flash[:success] = '更新しました'
      redirect_to missions_path
    else
      render 'edit'
    end
  end

  def destroy
    mission = Mission.find(params[:id])
    if mission.destroy
      redirect_to missions_path
    else
      redirect_to request.referer
    end
  end

  private

  def mission_params
    params.require(:mission).permit(:content, :deadline, :status, :user_id)
  end
end
