# frozen_string_literal: true

# https://docs.github.com/en/rest/search/search?apiVersion=2022-11-28#search-issues-and-pull-requests
# https://docs.github.com/en/search-github/searching-on-github/searching-issues-and-pull-requests
module PrQueryLibrary
  MY_PR_QUERY = 'is:pr is:open author:@me'
  ASSIGN_TO_ME_QUERY = 'is:pr is:open assignee:@me'
  REVIEW_REQUESTED_QUERY = 'is:pr is:open review-requested:@me state:open'

  LIBRARY = [
    ['My pullrequets', MY_PR_QUERY],
    ['Assign to me', ASSIGN_TO_ME_QUERY],
    ['Review requested', REVIEW_REQUESTED_QUERY]
  ].freeze
end
