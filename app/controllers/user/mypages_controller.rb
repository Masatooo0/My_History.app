class User::MypagesController < ApplicationController
  def mypage
    @dreams = Dream.where(user_id: current_user.id).includes(:user)
    @resumes = Resume.where(user_id: current_user.id).includes(:user)
    @advantages = Advantage.where(user_id: current_user.id).joins(:history).select("advantages.*, history_id, histories.title")
  end
end
