# Skip initialization if we don't have the credentials yet
# like assets:precompile step
return unless Rails.application.credentials.github

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,
           Rails.application.credentials.github.client_id,
           Rails.application.credentials.github.secret,
           scope: "repo"
end
