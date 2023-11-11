class DashboardController < ApplicationController
  def index
    @pr_signets = auth_user.pr_signets.order(:display_order)
  end

  def hide_offcanvas_details
    render turbo_stream: turbo_stream.remove(
      'offcanvas-pull-request-details-frame'
    )
  end
end
