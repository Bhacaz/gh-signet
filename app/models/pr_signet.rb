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

  store_attribute :display_settings, :expanded, :boolean, default: true

  validates :query, presence: true
  validates :title, presence: true
  validates :sort, presence: true
  validates :order, presence: true
  # uniqueness validation on database side. Setting a new pr_signet at position 1 will
  # ask to already update the other pr_signets BEFORE the validation.
  validates :display_order, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :display_order_maximum, if: :display_order_changed?

  after_save :reorder_other_display_order, if: :display_order_changed?
  after_destroy :reorder_other_display_order

  alias expanded? expanded

  def gh_pull_requests
    return @gh_pull_requests if defined?(@gh_pull_requests)

    response = user.octokit.search_issues(query, sort => order)
    @gh_pull_request_size = response.total_count
    Rails.cache.write(gh_pull_request_size_cache_key, @gh_pull_request_size, expires_in: 5.minutes)
    @gh_pull_requests = response.items
  end

  def gh_pull_request_size
    return @gh_pull_request_size if defined?(@gh_pull_request_size)

    if expanded?
      gh_pull_requests
      return @gh_pull_request_size
    end

    @gh_pull_request_size =
      Rails.cache.fetch(gh_pull_request_size_cache_key, expires_in: 5.minutes) do
        user.octokit.search_issues(query, { sort => order, per_page: 1 }).total_count
      end
  end

  private

  def gh_pull_request_size_cache_key
    "pr_signet_#{id}_gh_pull_request_size"
  end

  def display_order_maximum
    size = user.pr_signets.size
    size += 1 if new_record?

    if display_order > size
      errors.add(:display_order, "must be less than or equal to #{size} (number of Signets).")
    end
  end

  def reorder_other_display_order
    to_save =
    PrSignet
      .where(user_id: user_id)
      .order(display_order: :asc, updated_at: :desc)
      .each_with_index.map do |pr_signet, index|
        pr_signet.display_order = index + 1
        pr_signet
    end
    PrSignet.upsert_all to_save.map(&:attributes)
  end
end
