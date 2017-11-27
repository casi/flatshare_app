require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user  = users(:carsten)
    @user2 = users(:tina)
  end

  test "should get edit" do
    log_in_as @user

    get edit_admin_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    log_in_as @user

    patch admin_user_url(@user2), params: { user: { name: @user2.name, 
                                                   email: @user2.email,
                                                   password: "password",
                                                   password_confirmation: "password",
                                                   admin: @user2.admin } }

    assert_redirected_to edit_admin_user_path
  end

  test "should destroy user" do
    log_in_as @user

    assert_difference('User.count', -1) do
      delete admin_user_url(@user2)
    end

    assert_redirected_to admin_url
  end

end
