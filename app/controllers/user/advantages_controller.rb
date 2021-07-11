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
    if @advantage.save
      redirect_to advantages_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def advantage_params
    params.require(:advantage).permit(:history_id, :advantage)
  end
end
