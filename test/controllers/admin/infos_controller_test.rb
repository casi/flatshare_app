require 'test_helper'

class Admin::InfosControllerTest < ActionDispatch::IntegrationTest

  def setup
    @info = infos(:one)
    @user = users(:carsten)
  end

  test "should destroy info" do
    get login_path
    log_in_as @user
    
    assert_difference('Info.count', -1) do
      delete admin_info_url(@info)
    end

    assert_redirected_to admin_url
  end
end
