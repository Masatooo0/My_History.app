class User::ChartsController < ApplicationController
  def index
    #グラフX軸データ
    @period = Period.joins(:histories).includes(:histories).where('histories.user_id': current_user.id)
    gon.period = @period.order(:id).pluck(:period)

     #グラフY軸データ
    @history = History.where(user_id: current_user.id).includes(:user)
    gon.motivation = @history.order(:period_id).pluck(:motivation).map(&:to_i)
  end
end
