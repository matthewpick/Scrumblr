class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_current_user
  	@current_user = User.find(1)
  end
end
