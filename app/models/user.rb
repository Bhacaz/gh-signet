class User < ApplicationRecord
  encrypts :gho_token
  encrypts :email, deterministic: true

  has_many :pr_signets, dependent: :destroy

  def octokit
    @octokit ||= Octokit::Client.new(access_token: gho_token)
  end
end
