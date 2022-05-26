FROM ruby:2.7 as base
ENV RAILS_ENV=development
COPY config/database.yml.sample config/database.yml
ENV INSTALL_PATH /usr/src/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

FROM base as dev
ENV BUNDLE_VERSION 2.3.14
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${GEM_HOME}/bin:${GEM_HOME}/gems/bin:${BUNDLE_BIN}:${PATH}"
RUN gem install bundler --version "$BUNDLE_VERSION" \
    && rm -rf $GEM_HOME/cache/*

FROM base as production
ENV RAILS_ENV=production
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle config set without 'development test' && bundle config set deployment 'true'
RUN bundle install --jobs 20 --retry 5
COPY . .
