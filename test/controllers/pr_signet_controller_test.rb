require "test_helper"

class PrSignetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pr_signet_index_url
    assert_response :success
  end

  test "should get new" do
    get pr_signet_new_url
    assert_response :success
  end

  test "should get show" do
    get pr_signet_show_url
    assert_response :success
  end

  test "should get create" do
    get pr_signet_create_url
    assert_response :success
  end

  test "should get edit" do
    get pr_signet_edit_url
    assert_response :success
  end

  test "should get update" do
    get pr_signet_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pr_signet_destroy_url
    assert_response :success
  end
end
