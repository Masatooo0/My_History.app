class Batch::NotificationCreate
  def self.notification_create
    today = Date.today#今日の日付をとってくる
    missions = Mission.all#ミッションをとってくる
    today = Date.today
    missions.each do |mission|
      user = mission.user

      #締め切りが明日だった場合
      if today + 1 == mission.deadline.to_date
        Notification.create(mission_id: mission.id, user_id: user.id, checked: false, action: "warning")
      end

      #Notificationモデルが無く、今日が締め切りだった場合
      if mission.notification.nil? && today >= mission.deadline.to_date
        Notification.create(mission_id: mission.id, user_id: user.id, checked: false, action: "expired")
      #Notificationモデルが存在しており、今日が締め切りの場合
      elsif mission.notification.present? && today >= mission.deadline.to_date
        mission.notification.update(action: "expired")
      end

    end
    puts "通知をしました"
  end
end