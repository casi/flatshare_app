#!/bin/sh

set -e

echo "Updating assets (clean up + precompile)"
bundle exec rake assets:clean RAILS_ENV=production
bundle exec rake assets:precompile RAILS_ENV=production
