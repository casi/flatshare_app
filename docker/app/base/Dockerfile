FROM casi/ruby:2.3.3

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get install apache2 libapache2-mod-passenger -y \
	&& a2enmod passenger \
	&& a2dissite 000-default \
	&& mkdir -p /var/run/apache2 \
	&& chown -R www-data:www-data /var/run/apache2 \
	&& chmod -R 777 /var/run/apache2 \
	&& mkdir -p /var/log/apache2 \
	&& chown -R www-data:www-data /var/log/apache2 \
	&& chmod -R 777 /var/log/apache2

ENV APACHE_RUN_USER=www-data \
	APACHE_RUN_GROUP=www-data \
	APACHE_RUN_DIR=/var/run/apache2 \
	APACHE_LOG_DIR=/var/log/apache2 \
	APACHE_PID_FILE=/var/run/apache2/run.pid

ADD rootfs/ /

EXPOSE 8080

USER www-data

CMD ["apache2", "-DFOREGROUND"]
