class PullRequestsController < ApplicationController
  def details
    @pull_request = auth_user.octokit.pull_request(params[:repo], params[:number])
    sha = @pull_request.head.sha
    @statuses = []
    auth_user.octokit.check_runs_for_ref(params[:repo], sha).check_runs.each do |check|
      @statuses << check_to_status(check)
    end

    auth_user.octokit.combined_status(params[:repo], sha).statuses.each do |status|
      @statuses << status_to_status(status)
    end
    render turbo_stream: turbo_stream.replace('offcanvas-pull-request-details-frame', partial: 'pull_requests/offcanvas_details')
  end

  def show_loading_offcanvas_details
    render turbo_stream: turbo_stream.after('dashboard-masonry', partial: 'pull_requests/loading_offcanvas_pr_details')
  end

  private
  Status = Struct.new(:name, :avatar_url, :description, :context, :target_url, :conclusion)

  def status_to_status(status)
    Status.new(
      status.context,
      status.avatar_url,
      status.description,
      status.context,
      status.target_url,
      status.state
    )
  end
  def check_to_status(check)
    Status.new(
      check.name,
      check.app.owner.avatar_url,
      '',
      check.context,
      check.details_url,
      check.conclusion
    )
  end
end
