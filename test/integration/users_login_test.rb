require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:carsten)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:     @user.email,
                                          password:  'password' } }

    assert is_logged_in?
    assert_redirected_to infos_url
    follow_redirect!
    assert_template 'infos/index'
    assert_select "a[href=?]", login_path,          count: 0
    assert_select "a[href=?]", logout_path,         count: 1
    assert_select "a[href=?]", archived_infos_path, count: 1
    assert_select "a[href=?]", listitems_path,      count: 1
    assert_select "a[href=?]", housework_path,      count: 1
    assert_select "a[href=?]", qandas_path,         count: 1
    assert_select "a[href=?]", rules_path,          count: 1

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,         count: 0
    assert_select "a[href=?]", archived_infos_path, count: 0
    assert_select "a[href=?]", listitems_path,      count: 0
    assert_select "a[href=?]", housework_path,      count: 0
    assert_select "a[href=?]", qandas_path,         count: 0
    assert_select "a[href=?]", rules_path,          count: 0
  end

  test "should log out the logged in user" do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' }}
    assert is_logged_in?
    assert_redirected_to infos_url
    follow_redirect!
    get login_path
    assert @current_user.nil?
  end
end
