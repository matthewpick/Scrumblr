class SessionController < ApplicationController
  skip_before_filter :set_current_user

  def create
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) ||
              User.create_with_omniauth(auth)
    session[:session_token] = user.session_token
    redirect_to projects_path
  end

  def destroy
    session[:session_token] = nil
    redirect_to root_path, :notice => 'signed out!'
  end

end
