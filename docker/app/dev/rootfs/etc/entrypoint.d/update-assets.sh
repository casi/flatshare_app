#!/bin/sh

set -e

echo "Updating assets (clean up + precompile)"
bundle exec rails assets:clean RAILS_ENV=production
bundle exec rails assets:precompile RAILS_ENV=production
