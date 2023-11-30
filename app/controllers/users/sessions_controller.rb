# # frozen_string_literal: true

# module Users
#   class SessionsController < Devise::SessionsController
#     # before_action :configure_sign_in_params, only: [:create]
#     before_action :require_admin, only: %i[edit update]

#     # GET /resource/sign_in
#     # def new
#     #   super
#     # end

#     # POST /resource/sign_in
#     # def create
#     #   super
#     # end

#     # DELETE /resource/sign_out
#     # def destroy
#     #   super
#     # end

#     def require_admin
#       return if current_user&.admin? || action_name == "new"

#       flash[:alert] = "You must be an admin to perform this action."
#       redirect_to new_user_session_path
#     end

#     # protected

#     # If you have extra params to permit, append them to the sanitizer.
#     # def configure_sign_in_params
#     #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
#     # end
#   end
# end
