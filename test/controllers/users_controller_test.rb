require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:carsten)
    @user2 = users(:tina)
    ##@user3 = users(:sarah)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should get index" do
    log_in_as @user
    get users_path
    assert_response :success
  end

  test 'should create new user' do
    log_in_as @user
    get new_user_path

    assert_difference('User.count') do
      post users_url, params: { user: { name: 'Sarah B.',
                                        email: 'sarah.bpunkt@example.org',
                                        password: '654321',
                                        password_confirmation: '654321',
                                        admin: false }}
    end
    assert_redirected_to users_path
  end

  test "should get edit" do
    log_in_as @user
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    #get login_path
    log_in_as @user2

    patch user_url(@user2), params: {user: {name: @user2.name,
                                            email: @user2.email,
                                            password: "password",
                                            password_confirmation: "password",
                                            admin: @user2.admin
    }}

    assert_redirected_to edit_user_path
  end

end
