FROM tetraweb/php:7.1

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
#Install composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update -yqq \
    && apt-get install git zlib1g-dev libsqlite3-dev -y \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql

WORKDIR /app

COPY /test-service/unit/phpunit/phpunit.xml.dist /app/phpunit.xml.dist
COPY /test-service/unit/phpunit/bootstrap.php /app/tests/bootstrap.php
COPY /browse-service/html/public/app/slim/slim/Slim/Slim.php /app/Slim/Slim.php
COPY /browse-service/html/public/app/slim/slim/Slim/Middleware.php /app/Slim/Middleware.php
COPY /browse-service/html/public/app/slim/slim/Slim/View.php /app/Slim/View.php



RUN composer require --dev phpunit/phpunit:^5.7


COPY /browse-service/html/public/app/slim/slim/Slim/Environment.php /app/Slim/Environment.php
COPY /browse-service/html/public/app/slim/slim/Slim/Log.php /app/Slim/Log.php
COPY /browse-service/html/public/app/slim/slim/Slim/LogWriter.php /app/Slim/LogWriter.php
COPY /browse-service/html/public/app/slim/slim/Slim/Route.php /app/Slim/Route.php
COPY /browse-service/html/public/app/slim/slim/Slim/Router.php /app/Slim/Router.php

COPY /browse-service/html/public/app/slim/slim/Slim/Helper /app/Slim/Helper
COPY /browse-service/html/public/app/slim/slim/Slim/Middleware /app/Slim/Middleware
COPY /browse-service/html/public/app/slim/slim/Slim/Http /app/Slim/Http
COPY /browse-service/html/public/app/slim/slim/Slim/Exception /app/Slim/Exception



RUN chmod +x phpunit.xml.dist
RUN ["chmod", "+x", "tests/bootstrap.php"]

RUN phpdbg -qrr vendor/bin/phpunit --verbose --configuration phpunit.xml.dist --coverage-clover coverage.xml

# RUN composer require --dev phpstan/phpstan

# RUN vendor/bin/phpstan analyse /browse-service /viz-service | tee phpstan_results.txt

# WORKDIR /