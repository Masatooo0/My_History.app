class User::ChartsController < ApplicationController
  def index
    #グラフX軸データ
    @period = Period.joins(:histories).includes(:histories).where('histories.user_id': current_user.id)
    gon.period = @period.order(:id).pluck(:period, :title)

     #グラフY軸データ

    gon.motivation = @period.order(:id).pluck(:motivation)
  end
end
