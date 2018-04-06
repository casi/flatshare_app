require 'test_helper'

class Admin::AdminControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user  = users(:carsten)
  end

  test "should redirect index when not logged in" do
    get admin_url
    assert_redirected_to login_url
  end

  test "should get index" do
    log_in_as @user

    get admin_path
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

end
