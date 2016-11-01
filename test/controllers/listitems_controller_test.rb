require 'test_helper'

class ListitemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @listitem1 = listitems(:one)
    @listitem2 = listitems(:two)
    @user = users(:carsten)
  end

  test "should get index" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get listitems_url
    assert_response :success
  end

  test "should get update" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get listitems_url
    assert_response :success
  end

  test "should update listitem" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
                                          
    patch listitem_url(@listitem1), params: { listitem: { item: @listitem2.item,
                                                          done: :true } }
    assert_redirected_to listitems_url
  end

  test "should destroy all listitems" do
    assert_difference('Listitem.count', -1) do
      delete listitems_url
    end

    assert_redirected_to listitems_url
  end
end
