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
  # uniqueness validation on database side. Setting a new pr_signet at position 1 will
  # ask to already update the other pr_signets BEFORE the validation.
  validates :display_order, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :display_order_maximum

  def display_order_maximum
    size = user.pr_signets.size
    size + 1 if new_record?

    if display_order > size
      errors.add(:display_order, "must be less than or equal to #{size} (number of Signets). Current value: #{display_order}")
    end
  end

  after_initialize do
    if new_record?
      self.display_order = user.pr_signets.maximum(:display_order).to_i + 1
    end
  end

  before_save :reorder_display_order, if: :display_order_changed?

  def gh_pull_requests
    user.octokit.search_issues(query, sort => order).items
  end

  def reorder_display_order
    pp PrSignet.where(user_id: user_id).pluck(:display_order)
    PrSignet.where(user_id: user_id).where("display_order >= ?", display_order).update_all("display_order = display_order + 1")
  end
end
