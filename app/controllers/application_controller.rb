class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :address_line_one, :address_line_two, :admin, :email, :password,
               :password_confirmation, :province_id)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :address_line_one, :address_line_two, :admin, :email, :password,
               :password_confirmation, :current_password, :province_id)
    end
  end
end
