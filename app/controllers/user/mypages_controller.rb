class User::MypagesController < ApplicationController
  def mypage
    @resumes = Resume.all
  end
end
