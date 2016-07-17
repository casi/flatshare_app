require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "full title helper" do
  	assert_equal full_title, "Flatshare App"
  	assert_equal full_title("Rules"), "Rules | Flatshare App"
  end

  test "layout links" do
    get root_path
    assert_template 'infos/index'
    assert_template 'layouts/_shim'
    assert_template 'layouts/_header'
    assert_template 'layouts/_footer'

    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", rules_path
    assert_select "a[href=?]", users_path

    get rules_path
    assert_select "title", full_title("Rules")
    get users_path
    assert_select "title", full_title("Flatmates")
  end

end
