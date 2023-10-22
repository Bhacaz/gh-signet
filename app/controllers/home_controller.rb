class HomeController < ApplicationController
  skip_before_action :require_auth_user
  def index
    redirect_to dashboard_path if auth_user
  end
end
