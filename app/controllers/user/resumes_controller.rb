class User::ResumesController < ApplicationController

  def index
  end
  def new
    @resume = Resume.new
  end
  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id
    if @resume.save
      redirect_to resumes_path
    else
      render 'new'
    end
  end
  def edit
  end
  def update
  end
  def destroy
  end

  private
  def resume_params
    params.require(:resume).permit(:user_id, :period, :content, :status)
  end
end
