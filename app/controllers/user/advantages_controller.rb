class User::AdvantagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @advantages = Advantage.joins(:history).select("advantage, history_id, histories.title")
  end

  def new
    @advantage = Advantage.new
  end

  def create
    @advantage = Advantage.new(advantage_params)
    @advantage.user_id = current_user.id
    if @advantage.save
      redirect_to mypage_path
    else
      render 'new'
    end
  end

  def edit
    @advantage = Advantage.find(params[:id])
  end

  def update
    @advantage = Advantage.find(params[:id])
    @advantage.user_id = current_user.id
    if @advantage.update(advantage_params)
      redirect_to mypage_path
    else
      render "edit"
    end
  end

  def destroy
     advantage = Advantage.find(params[:id])
    if advantage.destroy
      redirect_to mypage_path
    else
      redirect_to request.referer
    end
  end

  private
  def advantage_params
    params.require(:advantage).permit(:history_id, :advantage, :user_id)
  end
end
