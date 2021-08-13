class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include User::NotificationsHelper
 # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    mypage_path
  end

  add_flash_types :success, :info, :warning, :danger

  protected
# ======devise userのストロングパラメータ=======
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name,
      :last_name,
      :birth_day,
      :is_valid
      ])
  end

end