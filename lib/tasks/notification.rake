namespace :mission do
  desc "notification/一日に一回動かす。"
  task :notification => :environment do
    today = Date.today
    missions = Mission.all
    n = missions.count
    today = Date.today
    missions.each do |mission|
      user = mission.user
      if today + 1 == mission.deadline.to_date
        Notification.create(mission_id: mission.id, user_id: user.id, action: "warning")
      end
      if mission.notification.nil? && today == mission.deadline.to_date
        Notification.create(mission_id: mission.id, user_id: user.id, action: "expired")
      elsif mission.notification.present? && today == mission.deadline.to_date
        mission.notification.update(action: "expired")
      end
      n -= 1
      puts "残り#{n}/#{missions.count}"
    end
  end
end
