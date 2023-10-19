class DashboardController < ApplicationController
  def index
    @@cache ||= auth_user.octokit.search_issues(*PrQueryLibrary::MY_PR_QUERY).items
    @pull_requests = @@cache
  end
end
