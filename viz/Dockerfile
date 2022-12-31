# Builder image
FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    unzip

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
#Install composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /

COPY ./viz/viz.portal.cssat.org.conf /etc/apache2/sites-available/vis.portal.cssat.org.conf

RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

# Install useful tools
RUN apt-get -y install apt-utils nano wget dialog

# Install important libraries
RUN apt-get -y install --fix-missing apt-utils build-essential git curl  libcurl4 libcurl4-openssl-dev zip

# Other PHP7 Extensions
RUN apt-get -y install libsqlite3-dev libsqlite3-0 mariadb-client
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_sqlite
RUN docker-php-ext-install mysqli

RUN docker-php-ext-install curl
RUN docker-php-ext-install tokenizer
RUN docker-php-ext-install json

RUN apt-get -y install zlib1g-dev
RUN apt-get install -y libzip-dev
RUN docker-php-ext-install zip

RUN apt-get -y install libicu-dev
RUN docker-php-ext-install -j$(nproc) intl

# RUN docker-php-ext-install mbstring
RUN docker-php-ext-install bcmath

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev

# Enable apache modules
RUN a2enmod rewrite headers
RUN a2enmod ssl


# WORKDIR /var/www/html
# ADD . /var/www/html
# RUN chown -R www-data:www-data /var/www

RUN a2dissite 000-default.conf
RUN a2ensite vis.portal.cssat.org.conf
RUN a2enmod ssl
RUN a2enmod rewrite
RUN a2enmod proxy_http

COPY common-resources/phpinstall.sh phpinstall.sh

COPY ./viz/html /portal-visualizations/  
COPY ./common-resources/ /portal-visualizations/public/content-data/   

RUN chown -R www-data:www-data phpinstall.sh

RUN ["chmod", "+x", "phpinstall.sh"]

USER www-data

CMD ./phpinstall.sh


# RUN chown -R www-data:www-data /portal-visualizations/
