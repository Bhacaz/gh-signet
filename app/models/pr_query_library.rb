# frozen_string_literal: true

# https://docs.github.com/en/rest/search/search?apiVersion=2022-11-28#search-issues-and-pull-requests

module PrQueryLibrary
  MY_PR_QUERY = ['is:open is:pr author:@me', sort: :updated]
  ASSIGN_TO_ME_QUERY = ['is:open is:pr assignee:@me sort:updated', sort: :updated]
  REVIEW_REQUESTED_QUERY = ['is:pr is:open review-requested:@me state:open type:pullrequests', sort: :updated]
end
