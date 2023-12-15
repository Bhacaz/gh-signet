class PullRequestsController < ApplicationController
  def details
    pr = PullRequestStatuses.new(user: auth_user, repo: params[:repo], number: params[:number])
    @pull_request = pr.pull_request
    @statuses = pr.statuses
    render turbo_stream: turbo_stream.replace('offcanvas-pull-request-details-frame', partial: 'pull_requests/offcanvas_details')
  end

  def statuses_summary
    pr = PullRequestStatuses.new(user: auth_user,
                                 repo: params[:repo],
                                 number: params[:number],
                                 updated_at: Time.parse(params[:updated_at]))
    @pull_request = pr.pull_request
    @statuses_summary = pr.status_summary
  end

  def show_loading_offcanvas_details
    render turbo_stream: turbo_stream.after('dashboard-container', partial: 'pull_requests/loading_offcanvas_pr_details')
  end
end
