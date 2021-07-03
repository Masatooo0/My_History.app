class User::HistoriesController < ApplicationController
  before_action :authenticate_user!

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
  end

  def update
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
