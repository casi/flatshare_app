require 'test_helper'

class ListitemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @listitem1 = listitems(:one)
    @listitem2 = listitems(:two)
    @user = users(:carsten)
  end

  test "should get index" do
    get login_path
    log_in_as @user

    get listitems_url
    assert_response :success
  end

  test "should create item" do
    get login_path
    log_in_as @user

    assert_difference('Listitem.count') do
      post listitems_url, params: { listitem: { item: @listitem1.item,
                                                done: @listitem1.done
      } }
    end

    assert_redirected_to listitems_url
  end

  test "should get update" do
    get login_path
    log_in_as @user

    get listitems_url
    assert_response :success
  end

  test "should update listitem" do
    get login_path
    log_in_as @user
                                          
    patch listitem_url(@listitem1), params: { listitem: { item: @listitem2.item,
                                                          done: :true } }
    assert_redirected_to listitems_url
  end

  test "should destroy listitems" do
    get login_path
    log_in_as @user

    assert_difference('Listitem.count', -1) do
      delete listitems_url
    end

    assert_redirected_to listitems_url
  end
end
