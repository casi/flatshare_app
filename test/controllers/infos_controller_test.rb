require 'test_helper'

class InfosControllerTest < ActionDispatch::IntegrationTest

  def setup
    @info = infos(:one)
    @user = users(:carsten)
  end

  test "should get index" do
    get login_path
    log_in_as @user

    get infos_url
    assert_response :success
  end

  test "should get new" do
    get new_info_url
    assert_response :success
  end

  test "should get new if inputs are wrong" do
    get new_info_url
    assert_no_difference('Info.count') do
      post infos_url, params: { info: { user_id: 1,
                                       title: '',
                                       content: '',
                                       archived: false }}
    end
    get new_info_url
    assert_response :success
  end

  test "should create info" do
    log_in_as @user

    assert_difference('Info.count') do
      post infos_url, params: { info: { user_id: 1, 
                                        content: @info.content, 
                                        title: @info.title,
                                        archived: false } }
    end

    assert_redirected_to infos_url
  end

  test "should show info" do
    get info_url(@info)
    assert_response :success
  end

  test "should get edit" do
    get edit_info_url(@info)
    assert_response :success
  end

  test "should update info" do
    patch info_url(@info), params: { info: { user_id: 1, 
                                             content: @info.content, 
                                             title: @info.title,
                                             archived: false } }
    assert_redirected_to infos_url
  end

  test "should set info as archived" do
    get infos_url
    patch info_url(@info), params: {info: { archived: true }}
    assert_redirected_to infos_url
  end

  test "should get index of archived infos" do
    get login_path
    log_in_as @user
    
    get archived_infos_url
    assert_response :success
  end
end
