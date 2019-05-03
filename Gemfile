# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.11'
gem 'bootstrap-sass'
gem 'carrierwave', '~> 1.2.2'
gem 'jbuilder', '~> 2.6'
gem 'jquery-rails'
gem 'mini_magick', '~> 4.8.0'
gem 'passenger', '>= 5.2.3', require: 'phusion_passenger/rack_handler'
gem 'rails', '~> 5.2.2'
gem 'sassc-rails'
gem 'sqlite3', '~> 1.3.6'
gem 'turbolinks', '~> 5'

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
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest-reporters'
  gem 'rails-controller-testing'

  # for code climate test coverage
  gem 'codeclimate-test-reporter'
  gem 'simplecov'
end

group :production do
  gem 'fog', '~> 1.38.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
