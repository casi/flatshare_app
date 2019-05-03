ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
# for codeclimate test coverage
require "simplecov"
SimpleCov.start

Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test user is logged in
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Log in as a particular user
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

# to avoid code duplication in tests
class ActionDispatch::IntegrationTest
  # Log in as a particular user.
  def log_in_as(user, password: 'password')
    post login_path, params: { session: { email: user.email,
                                          password: password } }
  end
end
