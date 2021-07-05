class User::HistoriesController < ApplicationController

  before_action :authenticate_user!

  def new
    @history = History.new
    contents = @history.contents.build
    contents.reasons.build
  end

  def create
    @history = History.new(history_params)
    @history.user_id = current_user.id
    if @history.save
      redirect_to root_path
    else
      render "new"
    end
  end


  private
  
  def history_params
    params.require(:history).permit(:period,
      contents_attributes: [
        :title, :event, :motivation, reasons_attributes:[
          :reason
        ]
      ]
    )
  end
end
