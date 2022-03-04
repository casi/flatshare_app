FROM ruby:2.7.5 as base
ENV RAILS_ENV=development
COPY config/database.yml.sample config/database.yml
ENV INSTALL_PATH /usr/src/app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

FROM base as dev
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${GEM_HOME}/bin:${GEM_HOME}/gems/bin:${BUNDLE_BIN}:${PATH}"
RUN gem install bundler

FROM base as production
ENV RAILS_ENV=production
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --deployment --without development test
COPY . .

