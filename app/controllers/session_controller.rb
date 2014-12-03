class SessionController < ApplicationController
  skip_before_filter :set_current_user

  def create
    auth = request.env['omniauth.auth']
    puts auth.inspect
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) ||
              User.create_with_omniauth(auth)

    # Pull info from github every time and check for changes with DB (sync function)
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.image_url = auth['info']['image']
    user.github_url = auth['extra']['raw_info']['html_url']
    user.save!

    puts user.inspect

    session[:session_token] = user.session_token
    redirect_to projects_path
  end

  def destroy
    session[:session_token] = nil
    redirect_to root_path, :notice => 'signed out!'
  end

end
