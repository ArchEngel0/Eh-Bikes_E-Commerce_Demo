class CheckoutController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @cart = session[:cart] || {}
    end
  end
end
