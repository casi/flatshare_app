require 'test_helper'

class QandasControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @qanda = qandas(:one)
    @user  = users(:carsten)
    @user2 = users(:tina)
  end

  test "should get index" do
    get login_path
    log_in_as @user

    get qandas_url
    assert_response :success
  end

  test "should get new" do
    log_in_as @user
    get new_qanda_url
    assert_response :success
  end

  test "should create qanda" do
    log_in_as @user
    assert_difference('Qanda.count') do
		post qandas_url, params: { qanda: { question: @qanda.question, 
                                        answer: @qanda.answer } }
    end

    assert_redirected_to qandas_url
  end

  test "should get edit" do
    log_in_as @user2
    get edit_qanda_url(@qanda)
    assert_response :success
  end

  test "should update qanda" do
    log_in_as @user2
    patch qanda_url(@qanda), params: { qanda: { question: @qanda.question, 
                                            	  answer: @qanda.answer } }
    assert_redirected_to qandas_url
  end

end
