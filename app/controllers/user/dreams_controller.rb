class User::DreamsController < ApplicationController
  before_action :authenticate_user!
  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user_id = current_user.id
    if @dream.save
      redirect_to mypage_path
    else
      render :new
    end
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def update
    @dream = Dream.find(params[:id])
    @dream.user_id = current_user.id
    if @dream.update(dream_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def destroy
    dream = Dream.find(params[:id])
    if dream.destroy
      redirect_to mypage_path
    else
      redirect_to request.referer
    end
  end

  private
  def dream_params
    params.require(:dream).permit(:user_id, :content)
  end
end
