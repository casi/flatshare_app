FROM casi/app-fs:1.0-base

USER root

# Ruby gem package dependencies
# * nokogiri
#   - liblzma-dev
#   - zlib1g-dev

# TBD: nokogiri, ffi, byebug (dev+test only), passenger in base image?! - long gem installation time...

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get install -y build-essential gcc liblzma-dev libsqlite3-dev ruby-dev zlib1g-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& gem install bundler --no-ri --no-rdoc

WORKDIR /app

CMD ["bundle", "install", "--deployment"]
