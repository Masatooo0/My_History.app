class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = '更新しました'
      redirect_to mypage_path
    else
      render 'edit'
    end
  end

  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :birth_day,  :profile_image)
  end
end
