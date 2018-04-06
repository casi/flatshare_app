source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',          '5.0.7'
gem 'bcrypt',         '~> 3.1.11'
gem 'carrierwave',    '~> 1.2.2'
gem 'mini_magick',    '~> 4.8.0'
gem 'fog',            '~> 1.38.0'
gem 'passenger',      '>= 5.2.3', require: 'phusion_passenger/rack_handler'
gem 'sqlite3'
gem 'jquery-rails'
gem 'turbolinks',     '~> 5'
gem 'jbuilder',       '~> 2.6'

group :development, :test do
  gem 'bootstrap-sass'
  gem 'sass-rails',     '~> 5.0.6'
  gem 'faker',          '~> 1.8.7'
  # BEGIN: copied from :default scope because we pre-compile in prod
  gem 'uglifier',       '>= 3.0'
  gem 'coffee-rails',   '~> 4.2'
  # END: copied from :default scope because we pre-compile in prod
  gem 'awesome_print'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console'
  gem 'listen',                '~> 3.1.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'

  # for code climate test coverage
  gem 'simplecov'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

