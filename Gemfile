source 'https://rubygems.org'

gem 'rails',          '5.0.2'
gem 'bcrypt',         '~>3.1.11'
gem 'faker',          '~>1.6.6'
gem 'carrierwave',    '~>0.11.2'
gem 'mini_magick',    '~>4.5.1'
gem 'fog',            '~>1.38.0'
gem 'bootstrap-sass'
gem 'passenger',      '>= 5.1', require: 'phusion_passenger/rack_handler'
gem 'sqlite3'
gem 'sass-rails',     '~>5.0.6'
gem 'jquery-rails'
gem 'turbolinks',     '~> 5'
gem 'jbuilder',       '~> 2.6'

group :development, :test do
  # BEGIN: copied from :default scope because we pre-compile in prod
  gem 'uglifier',       '>= 3.0'
  gem 'coffee-rails',   '~> 4.2'
  # END: copied from :default scope because we pre-compile in prod
  gem 'awesome_print'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console'
  gem 'listen',                '~>3.1.5'
  gem 'spring',                '~> 2.0.0'
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

