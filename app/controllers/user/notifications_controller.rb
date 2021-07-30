class User::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # indexにアクセスすると既読に変更
    @notifications = current_user.notifications.where(checked: false)
    @notifications.each do |notification|
      notification.update(checked: true)
    end
  end
end
