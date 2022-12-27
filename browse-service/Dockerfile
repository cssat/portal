# Builder image
FROM php:7.4-apache as builder

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    unzip

WORKDIR /

# # Install portal-browse
# RUN wget https://github.com/josephmienko/portal-browse-public/archive/refs/heads/master.zip -O portal-browse.zip
# RUN unzip portal-browse.zip

# # Install portal-content
# RUN wget https://github.com/josephmienko/portal-content-public/archive/refs/heads/master.zip -O portal-content.zip 
# RUN unzip portal-content.zip

# COPY portal-browse-public-master  /portal-browse/
# COPY portal-content-public-master /portal-browse/public/content-data

COPY browse-service/portal.cssat.org.conf /etc/apache2/sites-available/portal.cssat.org.conf
# COPY bin/common/config.json /portal-browse/public/config.json

RUN a2dissite 000-default.conf
RUN a2ensite portal.cssat.org.conf
RUN a2enmod ssl
RUN a2enmod rewrite
RUN a2enmod proxy_http

# RUN chown -R www-data:www-data /portal-browse/
