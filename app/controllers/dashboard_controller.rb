class DashboardController < ApplicationController
  def index
    @pull_requests= {
      'My Pull Requests' => auth_user.octokit.search_issues(*PrQueryLibrary::MY_PR_QUERY).items,
      'Assigned to me' => auth_user.octokit.search_issues(*PrQueryLibrary::ASSIGN_TO_ME_QUERY).items,
      'Review requests' => auth_user.octokit.search_issues(*PrQueryLibrary::REVIEW_REQUESTED_QUERY).items,
      'Team review requests' => []
    }
  end
end
