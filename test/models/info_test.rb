require 'test_helper'

class InfoTest < ActiveSupport::TestCase

  def setup
    @info = infos(:one)
  end

  test "should be valid" do
    assert @info.valid?
  end

  test "user id should be present" do
    @info.user_id = nil
    assert_not @info.valid?
  end
end
