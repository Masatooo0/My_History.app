class User::ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id
    if @resume.save
      flash[:success] = '保存しました'
      redirect_to mypage_path
    else
      render 'new'
    end
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    @resume.user_id = current_user.id
    if @resume.update(resume_params)
      flash[:success] = '更新しました'
      redirect_to mypage_path
    else
      render 'edit'
    end
  end

  def destroy
    resume = Resume.find(params[:id])
    if resume.destroy
      redirect_to mypage_path
    else
      redirect_to request.referer
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:user_id, :period, :content, :status)
  end
end
