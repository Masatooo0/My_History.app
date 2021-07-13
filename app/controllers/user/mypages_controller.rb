class User::MypagesController < ApplicationController
  def mypage
    @resumes = Resume.where(user_id: current_user.id).includes(:user)
    @advantages = Advantage.joins(:history).where(user_id: current_user.id).select("advantage, history_id, histories.title")
  end
end
