class User::ChartsController < ApplicationController
  def index
    @history = History.where(user_id: current_user.id).includes(:user)
    gon.motivation = @history.pluck(:motivation).map(&:to_i)
    @period = Period.joins(:histories).includes(:histories)
    gon.data2 = @period.order(period: :DESC).pluck(:period)
  end
end
