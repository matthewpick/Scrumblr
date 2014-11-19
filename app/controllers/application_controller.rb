class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_current_user
  	# @current_user = User.find(1)
  end

  private
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token]) if session[:session_token]
  end
  helper_method :current_user
end
