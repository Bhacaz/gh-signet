# frozen_string_literal: true

stack = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache, store: Rails.cache, serializer: Marshal, logger: Rails.logger, shared_cache: false
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end

Octokit.middleware = stack
