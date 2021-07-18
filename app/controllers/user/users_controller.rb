class User::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to mypage_path
  end

  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :birth_day,  :profile_image)
  end
end
