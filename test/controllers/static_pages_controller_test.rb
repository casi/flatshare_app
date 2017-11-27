require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
  	@base_title = "| Flatshare App"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "Log in #{@base_title}"
  end

  test "should get login" do
    get login_path
    assert_response :success
    assert_select "title", "Log in #{@base_title}"
  end

end
