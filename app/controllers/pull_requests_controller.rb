class PullRequestsController < ApplicationController
  def details
    @pull_request = auth_user.octokit.pull_request(params[:repo], params[:number])
    # turbo_stream.replace(:pull_request_details_panel)
  end
end
