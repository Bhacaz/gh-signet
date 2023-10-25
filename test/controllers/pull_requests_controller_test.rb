require "test_helper"

class PullRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get details" do
    get pull_requests_details_url
    assert_response :success
  end
end
