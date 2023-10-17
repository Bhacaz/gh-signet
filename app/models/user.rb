class User < ApplicationRecord
  encrypts :gho_token
  encrypts :email, deterministic: true

  def octokit
    @octokit ||= Octokit::Client.new(access_token: gho_token)
  end
end
