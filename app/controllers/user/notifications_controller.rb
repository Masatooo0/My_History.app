class User::NotificationsController < ApplicationController
  
  def index
    # indexにアクセスすると既読に変更
    @notifications = current_user.notifications
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
