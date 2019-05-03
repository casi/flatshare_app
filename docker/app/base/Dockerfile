FROM casi257/ruby:2.6-stretch

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get install --no-install-recommends apache2 imagemagick libapache2-mod-passenger -y \
	&& a2enmod passenger \
	&& a2dissite 000-default \
	&& mkdir -p /var/www/app \
	&& rm -rf /var/lib/apt/lists/*

ADD rootfs/ /

EXPOSE 8080

CMD ["apache2ctl"]
