# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt'
gem 'bootsnap',       '>= 1.9.3', require: false
gem 'carrierwave'
gem 'jbuilder',       '~> 2.10'
gem 'mini_magick',    '~> 4.10'
gem 'mimemagic',      '~> 0.4.3'
gem 'puma'
gem 'pg',             '~> 1.2', '>= 1.2.3'
gem 'rails',          '~> 6.1.0'

# frontend gems
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'mini_racer'
gem 'sassc-rails'
gem 'turbolinks',     '~> 5'
gem 'uglifier'

group :development, :test do
  # BEGIN: copied from :default scope because we pre-compile in prod
  gem 'coffee-rails'
  # END: copied from :default scope because we pre-compile in prod
  gem 'awesome_print'
  gem 'byebug', platform: :mri
  gem 'faker'
  gem 'pry', '~> 0.13.1'
end

group :development do
  gem 'listen',                 '~> 3.3'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'web-console',            '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  # gem 'chromedriver-helper'
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest-reporters'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'webdrivers'

  # for code climate test coverage
  gem 'codeclimate-test-reporter'
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
