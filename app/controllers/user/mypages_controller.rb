class User::MypagesController < ApplicationController
  def mypage
    @user = User.all
    @resumes = Resume.all
    @advantages = Advantage.joins(:history).select("advantage, history_id, histories.title")
  end
end
