class DashboardController < ApplicationController
  def index
    @pr_signets = auth_user.pr_signets.order(:display_order)
  end
end
