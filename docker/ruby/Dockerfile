FROM casi/debian:stretch

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install ruby -y \
	&& gem install bundler --no-ri --no-rdoc \
	&& rm -rf /var/lib/apt/lists/*
