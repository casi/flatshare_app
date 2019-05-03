FROM casi257/app-fs:1.0-dev as builder

ADD . /app

WORKDIR /app

ENV SECRET_KEY_BASE=JustForBuild \
	BUNDLE_APP_CONFIG=/app/.bundle

# in order to set up the correct user / group for the application
# directory for apache, we create the uploads folder here,
# chown the /app directory properly and provide a tar.gz file
# for the next stage (FROM) in this Dockerfile
RUN bundle install --deployment \
	&& bundle exec rails assets:clean RAILS_ENV=production \
	&& bundle exec rails assets:precompile RAILS_ENV=production \
	&& bundle install --deployment --without test development \
	&& bundle clean \
	&& mkdir -p /app/public/uploads \
	&& chown -R www-data:www-data /app \
	&& tar czf /tmp/app.tar.gz /app

FROM casi257/app-fs:1.0-base

# copy the built app.tar.gz and extract to /var/www - which
# will left the owner/group settings intact. Removing it afterwards
# will **NOT** decrease the resulting image size, but will left
# the image in a cleaned up state.
COPY --from=builder /tmp/app.tar.gz /tmp
RUN cd /var/www \
	&& tar xzf /tmp/app.tar.gz \
	&& rm -f /tmp/app.tar.gz

VOLUME ["/var/www/app/public/uploads"]
