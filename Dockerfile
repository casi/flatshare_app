FROM ruby:3.1-slim as base
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install --no-install-recommends libsqlite3-dev imagemagick build-essential gnupg -y \
    && rm -rf /var/lib/apt/lists/*

ENV BUNDLE_VERSION 2.3.19
ENV RAILS_ENV=development
COPY config/database.yml.sample config/database.yml
ENV INSTALL_PATH /usr/src/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

FROM base as dev
ENV GEM_HOME=/bundle
ENV GEM_PATH=$GEM_HOME
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
# make 'docker logs' work
ENV RAILS_LOG_TO_STDOUT=true
RUN gem install bundler --version "$BUNDLE_VERSION" \
    && rm -rf $GEM_HOME/cache/*

FROM base as production
ENV RAILS_ENV=production
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle config set without 'development test' && bundle config set deployment 'true'
RUN gem install bundler --version "$BUNDLE_VERSION"
RUN bundle install --jobs 20 --retry 5
COPY . .

EXPOSE 3000
