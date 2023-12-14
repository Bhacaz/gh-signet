# frozen_string_literal: true

class PullRequest
  include ActiveModel::API
  Status = Struct.new(:name, :avatar_url, :description, :context, :target_url, :conclusion)

  attr_accessor :user, :repo, :number

  def pull_request
    @pull_request ||= user.octokit.pull_request(repo, number)
  end

  def status_summary
    conclusions = statuses.map(&:conclusion).uniq
    return 'error' if conclusions.include?('error')
    return 'failure' if conclusions.include?('failure')
    return 'pending' if conclusions.include?('pending')
    'success'
  end

  def statuses
    Rails.cache.fetch(statuses_cache_key, expires_in: 3.hour) do
      sha = pull_request.head.sha
      statuses = []

      checks = user.octokit.check_runs_for_ref(repo, sha).check_runs
      checks = checks.group_by(&:name).values.map { |checks_by_name| checks_by_name.max_by(&:created_at) }
      checks.each do |check|
        statuses << check_to_status(check)
      end

      user.octokit.combined_status(repo, sha).statuses.each do |status|
        statuses << status_to_status(status)
      end

      statuses
    end
  end

  def statuses_cache_key
    "#{pull_request.id}/#{pull_request.updated_at.to_i}"
  end

  private

  def status_to_status(status)
    Status.new(
      status.context,
      status.avatar_url,
      status.description,
      status.context,
      status.target_url,
      status.state
    )
  end

  def check_to_status(check)
    Status.new(
      check.name,
      check.app.owner.avatar_url,
      '',
      check.context,
      check.details_url,
      check.conclusion
    )
  end
end
