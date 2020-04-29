#FROM casi257/app-fs:1.0-dev as dev
FROM ruby:2.6.1 as base
COPY config/database.yml.sample config/database.yml
COPY Gemfile* ./

FROM base as dev

COPY config/database.yml.sample config/database.yml
COPY Gemfile* ./

ENV INSTALL_PATH /usr/src/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN bundle update --bundler

FROM base as ci

COPY Gemfile* ./

RUN bundle install --jobs 20 --retry 5

FROM base as production

COPY Gemfile* ./

RUN bundle install --jobs 20 --retry 5 --deployment --without development test
COPY . .

EXPOSE 3000

#ENV SECRET_KEY_BASE=JustForBuild \
	#BUNDLE_APP_CONFIG=/app/.bundle

# in order to set up the correct user / group for the application
# directory for apache, we create the uploads folder here,
# chown the /app directory properly and provide a tar.gz file
# for the next stage (FROM) in this Dockerfile

#RUN bundle install --deployment \
	#&& bundle exec rails assets:clean RAILS_ENV=production \
	#&& bundle exec rails assets:precompile RAILS_ENV=production \
	#&& bundle install --deployment --without test development \
	#&& bundle clean \
	#&& mkdir -p /app/public/uploads \
	#&& chown -R www-data:www-data /app \
	#&& tar czf /tmp/app.tar.gz /app

#FROM casi257/app-fs:1.0-base

# copy the built app.tar.gz and extract to /var/www - which
# will leave the owner/group settings intact. Removing it afterwards
# will **NOT** decrease the resulting image size, but will leave
# the image in a cleaned up state.

#COPY --from=builder /tmp/app.tar.gz /tmp
#RUN cd /var/www \
	#&& tar xzf /tmp/app.tar.gz \
	#&& rm -f /tmp/app.tar.gz

#VOLUME ["/var/www/app/public/uploads"]
