class HomeController < ApplicationController
  def index
    redirect_to dashboard_path if auth_user
  end
end
