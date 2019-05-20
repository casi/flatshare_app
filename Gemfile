# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
ruby '2.6.3'

gem 'bcrypt',         '~> 3.1.11'
gem 'bootstrap-sass'
gem 'carrierwave',    '~> 1.2.3'
gem 'jbuilder',       '~> 2.6'
gem 'jquery-rails'
gem 'mini_magick',    '~> 4.8'
gem 'passenger',      '>= 6.0.2', require: 'phusion_passenger/rack_handler'
gem 'rails',          '~> 5.2.3'
gem 'sassc-rails'
gem 'sqlite3'
gem 'turbolinks',     '~> 5'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem 'faker'
  # BEGIN: copied from :default scope because we pre-compile in prod
  gem 'coffee-rails'
  gem 'uglifier'
  # END: copied from :default scope because we pre-compile in prod
  gem 'awesome_print'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'web-console',            '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest-reporters'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'

  # for code climate test coverage
  gem 'codeclimate-test-reporter'
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
