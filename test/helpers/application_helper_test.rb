require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,              'Flatshare App'
    assert_equal full_title('Log In'),    'Log In | Flatshare App'
    assert_equal full_title('Flatmates'), 'Flatmates | Flatshare App'
    assert_equal full_title('Edit Profile'), 'Edit Profile | Flatshare App'
    assert_equal full_title('Admin'),     'Admin | Flatshare App'
  end
end
