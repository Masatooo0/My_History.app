class User::HistoriesController < ApplicationController

  before_action :authenticate_user!

  def index
    @period = Period.joins(:histories).includes(:histories)
  end

  def show
    @history = History.joins(:reasons).includes(:reasons).find(params[:id])
  end

  def new
    @history = History.new
    @history.reasons.build
  end

  def create
    @history = History.new(history_params)
    @history.user_id = current_user.id
    if @history.save
      redirect_to history_path(@history.id)
    else
      render "new"
    end
  end

  def edit
    @history = History.find(params[:id])
  end

  def update
    @history = History.find(params[:id])
    @history.user_id = current_user.id
    if @history.update(history_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    history = History.find(params[:id])
    if history.destroy
      redirect_to root_path
    else
      redirect_to request.referer
    end
  end

  private

  def history_params
    params.require(:history).permit(
      :period_id, :title, :event, :motivation, :user_id, reasons_attributes:[
        :reason, :id, :_destroy
      ]
    )
  end
end