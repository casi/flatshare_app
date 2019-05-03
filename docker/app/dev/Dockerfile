FROM casi257/app-fs:1.0-base

# Ruby gem package dependencies
# * nokogiri
#   - liblzma-dev
#   - zlib1g-dev

# TBD: nokogiri, ffi, byebug (dev+test only), passenger in base image?! - long gem installation time...

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get install --no-install-recommends -y \
	build-essential gcc liblzma-dev libsqlite3-dev nodejs ruby-dev zlib1g-dev \
	&& ln -sf /usr/bin/nodejs /usr/local/bin/node \
	&& rm -rf /var/lib/apt/lists/*

ADD rootfs/ /

WORKDIR /app

CMD ["bundle", "install", "--deployment"]
