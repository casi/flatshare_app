require 'test_helper'

class ListitemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @listitem1 = listitems(:one)
    @listitem2 = listitems(:two)
  end

  test "should get index" do
    get listitems_url
    assert_response :success
  end

  test "should get update" do
    get listitems_url
    assert_response :success
  end

  test "should update listitem" do
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
