class User::HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @history = History.new
    @history.build_period
    @reason = @history.reasons.new

  end

  def create
    @history = History.new(history_params)
    @history.user_id = current_user.id
    if @history.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @history = History.find(params[:id])
  end

  def update
    @history = History.find(params[:id])
    @history.update(history_params)
    redirect_to root_path
  end
  private
  def history_params
    params.require(:history).permit(
      :title, :event, :motivation,
      period_attributes: [:period, :_destroy, :id],
      reasons_attributes: [:reason, :_destroy, :id]
      )
  end
end
