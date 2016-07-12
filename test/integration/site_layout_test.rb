require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "full title helper" do
  	assert_equal full_title,			    "Flatshare App"
  	assert_equal full_title("Rules"), "Rules | Flatshare App"
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", rules_path

    get rules_path
    assert_select "title", full_title("Rules")
  end

end
