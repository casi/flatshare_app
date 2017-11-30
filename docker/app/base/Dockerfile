FROM casi/ruby:2.3.3

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get install apache2 imagemagick libapache2-mod-passenger -y \
	&& a2enmod passenger \
	&& a2dissite 000-default \
	&& mkdir -p /var/www/app

ADD rootfs/ /

EXPOSE 8080

CMD ["apache2ctl"]
