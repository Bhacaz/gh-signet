class UserController < ApplicationController
  def delete
    auth_user.destroy!
    session[:user_id] = nil
    redirect_to root_path
  end
end
