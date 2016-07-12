require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
  	@base_title = "| Flatshare App"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "Home #{@base_title}"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home #{@base_title}"
  end

  test "should get rules" do
    get static_pages_rules_url
    assert_response :success
    assert_select "title", "Rules #{@base_title}"
  end
end
