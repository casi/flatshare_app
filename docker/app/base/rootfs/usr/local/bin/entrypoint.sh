#!/bin/sh

set -e

# TODO: check if SQLite is used for production
# TODO: if DBMS is integrated, check rake tasks if db:setup can be executed conditionally
if [ ! -f /data/production.sqlite3 ]; then
	echo "Database not existing, executing setup..."
	bundle exec rake db:setup RAILS_ENV=production

	chown -R www-data:www-data /data/
	# passenger runs as nobody:nobody
	chmod -R 777 /data/
else
	echo "Database existing, running migrations..."
	bundle exec rake db:migrate RAILS_ENV=production

	chown -R www-data:www-data /data/
	# passenger runs as nobody:nobody
	chmod -R 777 /data/
fi

# for DBMS (pseudo code)
#if [ bundle exec rake db:needs-setup RAILS_ENV=production 1>/dev/null 2>&1 ]; then
#	bundle exec rake db:setup RAILS_ENV=production
#fi
#bundle exec rake db:migrate RAILS_ENV=production

# Provide API for entrypoint users
for f in /etc/entrypoint.d/*; do
    case "$f" in
        *.sh)   echo "$0: running $f"; . "$f" ;;
        *)      echo "$0: ignoring $f" ;;
    esac
    echo
done

exec "$@"
