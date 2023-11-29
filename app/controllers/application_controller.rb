class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :require_admin, only: %i[new create edit update destroy]

  def require_admin
    return if current_user&.admin?

    flash[:alert] = "You are not authorized to access this page."
    redirect_to root_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :address_line_one, :address_line_two, :admin, :email, :password,
               :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :address_line_one, :address_line_two, :admin, :email, :password,
               :password_confirmation, :current_password)
    end
  end
end
