class ApplicationController < ActionController::Base
  before_action :require_auth_user

  def require_auth_user
    redirect_to root_path unless auth_user
  end

  def auth_user
    @auth_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :auth_user
end
