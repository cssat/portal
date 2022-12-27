# Builder image
FROM php:7.4-apache

RUN apt-get update && apt-get install -y git curl build-essential openssl libssl-dev wget unzip 

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /

COPY browse-service/portal.cssat.org.conf /etc/apache2/sites-available/portal.cssat.org.conf

RUN a2dissite 000-default.conf
RUN a2ensite portal.cssat.org.conf
RUN a2enmod ssl
RUN a2enmod rewrite
RUN a2enmod proxy_http

COPY common-resources/phpinstall.sh home/phpinstall.sh

RUN chown -R www-data:www-data home

RUN chown -R www-data:www-data home/phpinstall.sh

RUN ["chmod", "+x", "home/phpinstall.sh"]

USER www-data

CMD home/phpinstall.sh
