class User::HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @period = Period.joins(:histories).includes(:histories).where('histories.user_id': current_user.id).order(:id)
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
      flash[:success] = '保存しました'
      redirect_to history_path(@history.id)
    else
      render 'new'
    end
  end

  def edit
    @history = History.find(params[:id])
  end

  def update
    @history = History.find(params[:id])
    @history.user_id = current_user.id
    if @history.update(history_params)
      flash[:success] = '更新しました'
      redirect_to history_path(@history.id)
    else
      render 'edit'
    end
  end

  def destroy
    history = History.find(params[:id])
    if history.destroy
      redirect_to histories_path
    else
      redirect_to request.referer
    end
  end

  private

  def history_params
    params.require(:history).permit(
      :period_id, :title, :event, :motivation, :image, :summarize, :user_id, reasons_attributes:[
        :reason, :id, :_destroy
      ]
    )
  end
end