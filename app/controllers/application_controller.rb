class ApplicationController < ActionController::Base
  def auth_user
    @auth_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :auth_user
end
