class PullRequestsController < ApplicationController
  def details
    pr = PullRequestStatuses.new(user: auth_user, repo: params[:repo], number: params[:number])
    @pull_request = pr.pull_request
    @statuses = pr.statuses
  end

  def statuses_summary
    pr = PullRequestStatuses.new(user: auth_user,
                                 repo: params[:repo],
                                 number: params[:number],
                                 updated_at: Time.parse(params[:updated_at]))
    @pull_request = pr.pull_request
    @statuses_summary = pr.status_summary
  end
end
