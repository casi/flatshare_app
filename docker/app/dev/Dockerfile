FROM ruby:2.6-slim-stretch

RUN DEBIAN_FRONTEND=noninteractive \
	&& apt-get update -qq \
	&& apt-get install --no-install-recommends -y \
	build-essential gcc liblzma-dev libsqlite3-dev ruby-dev zlib1g-dev \
	&& apt-get clean all

# ADD rootfs/ /

# WORKDIR /app

# CMD ["bundle", "install", "--deployment"]
