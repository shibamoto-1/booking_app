require "test_helper"

class Users::AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_account_edit_url
    assert_response :success
  end

  test "should get show" do
    get users_account_show_url
    assert_response :success
  end

  test "should get update" do
    get users_account_update_url
    assert_response :success
  end
end
