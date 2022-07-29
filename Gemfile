# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt',         '~> 3.1.7'
gem 'bootsnap',       '>= 1.9.3', require: false
gem 'carrierwave',    '~> 2.2'
gem 'jbuilder',       '~> 2.10'
gem 'mini_magick',    '~> 4.10'
gem 'puma',           '~> 5.0'
gem 'rails',          '~> 6.1.0'
gem 'sqlite3',        '~> 1.4'

## Due to newly libffi requirements
gem 'ffi'
# a Ruby 3.1 requirement
gem 'net-smtp'

# frontend gems
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'mini_racer'
gem 'sassc-rails'
gem 'turbolinks',     '~> 5.2.0'
gem 'uglifier'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platform: :mri
  gem 'faker'
  gem 'pry', '~> 0.13.1'
end

group :development do
  gem 'listen',                 '~> 3.3'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'web-console',            '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 2.15'
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
