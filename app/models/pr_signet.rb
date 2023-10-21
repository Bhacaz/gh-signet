class PrSignet < ApplicationRecord
  belongs_to :user

  enum sort: {
    updated: 0,
    created: 1,
    reactions: 2,
    interactions: 3,
    comments: 4
  }

  enum order: {
    desc: 0,
    asc: 1
  }

  validates :query, presence: true
  validates :title, presence: true
  validates :sort, presence: true
  validates :order, presence: true

  def gh_pull_requests
    user.octokit.search_issues(query, sort => order).items
  end
end
