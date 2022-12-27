# Builder image
FROM php:7.4-apache as builder

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    unzip

WORKDIR /

# # Install portal-visualizations
# RUN wget https://github.com/josephmienko/portal-visualizations-public/archive/refs/heads/master.zip -O portal-visualizations.zip
# RUN unzip portal-visualizations.zip

# # # Install portal-content
# RUN wget https://github.com/josephmienko/portal-content-public/archive/refs/heads/master.zip -O portal-content.zip
# RUN unzip portal-content.zip

# # # Copy the assets that we need to run from the builder image
# RUN mv /portal-visualizations-public-master portal-visualizations
# RUN mv /portal-content-public-master /portal-visualizations/public/content-data/

COPY ./viz-service/viz.portal.cssat.org.conf /etc/apache2/sites-available/vis.portal.cssat.org.conf
# COPY ./bin/common/config.json /portal-visualizations/public/config.json
# COPY ./bin/viz/local.php /portal-visualizations/public/config/local.php
# COPY ./bin/viz/config.php /portal-visualizations/public/config/config.php

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


# RUN chown -R www-data:www-data /portal-visualizations/
