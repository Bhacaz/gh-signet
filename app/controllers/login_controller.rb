class LoginController < ApplicationController
  def create
    auth = request.env['omniauth.auth']

    user = User.find_or_initialize_by(provider_id: auth['uid'])
    user.username = auth['info']['nickname']
    user.email = auth['info']['email']
    user.gho_token ||= auth['credentials']['token']
    user.name = auth['info']['name']
    user.avatar_url = auth['info']['image']
    user.save!
    session[:user_id] = user.id

    redirect_to dashboard_path
  end
end
