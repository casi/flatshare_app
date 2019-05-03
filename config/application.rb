require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FlatshareApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Version. Only attempt update on local machine
    if Rails.env.development?
      # Update version file from latest git tag
      File.open('config/version', 'w') do |file|
        file.write `git describe --tags --always`
      end
    end

    config.version = File.read('config/version')
    config.time_zone = 'Berlin'
    config.active_record.default_timezone = :local
  end
end
