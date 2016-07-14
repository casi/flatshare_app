require 'test_helper'

class InfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info = infos(:one)
  end

  test "should get index" do
    get infos_url
    assert_response :success
  end

  test "should get new" do
    get new_info_url
    assert_response :success
  end

  test "should create info" do
    assert_difference('Info.count') do
      post infos_url, params: { info: { author: @info.author, 
                                        content: @info.content, 
                                        title: @info.title } }
    end

    assert_redirected_to infos_url
  end

  test "should get edit" do
    get edit_info_url(@info)
    assert_response :success
  end

  test "should update info" do
    patch info_url(@info), params: { info: { author: @info.author, 
                                             content: @info.content, 
                                             title: @info.title } }
    assert_redirected_to infos_url
  end

  test "should destroy info" do
    assert_difference('Info.count', -1) do
      delete info_url(@info)
    end

    assert_redirected_to infos_url
  end
end
