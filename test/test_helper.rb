ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
# for codeclimate test coverage
require "simplecov"
SimpleCov.start

Minitest::Reporters.use!

# to avoid code duplication in tests
module LogInHelper
  # log in a test user
  def log_in_as(user, options = {})
    password = options[:password] || 'password'

    if integration_test?
      post login_path, params: {session: { email:    user.email,
                                           password: password } }
    else
      session[:user_id] = user.id
    end
  end
end

class ActionDispatch::IntegrationTest
  include LogInHelper
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include ApplicationHelper

  # Returns true if a test user is logged in
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Log in as a particular user
  def log_in_as(user)
    session[:user_id] = user.id
  end

  private

    def integration_test?
      defined?(post_via_redirect)
    end

end
