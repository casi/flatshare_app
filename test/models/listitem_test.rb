require 'test_helper'

class ListitemTest < ActiveSupport::TestCase
  
  def setup
    @listitem = listitems(:one)
  end

  test "listitem should be present" do
    @listitem.item = nil
    assert_not @listitem.valid?
  end
end
