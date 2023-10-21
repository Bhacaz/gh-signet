# frozen_string_literal: true

# https://docs.github.com/en/rest/search/search?apiVersion=2022-11-28#search-issues-and-pull-requests
# https://docs.github.com/en/search-github/searching-on-github/searching-issues-and-pull-requests
module PrQueryLibrary
  MY_PR_QUERY = 'is:open is:pr author:@me'
  ASSIGN_TO_ME_QUERY = 'is:open is:pr assignee:@me'
  REVIEW_REQUESTED_QUERY = 'is:pr is:open review-requested:@me state:open type:pullrequests'

  LIBRARY = [
    MY_PR_QUERY, ASSIGN_TO_ME_QUERY, REVIEW_REQUESTED_QUERY
  ].freeze
end
