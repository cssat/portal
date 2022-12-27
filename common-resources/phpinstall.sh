#!/bin/sh

rm -rf /${VIRTUAL_HOST_ROOT}/public/app/composer
rm -rf /${VIRTUAL_HOST_ROOT}/public/app/slim
rm -rf /${VIRTUAL_HOST_ROOT}/public/app/vendor
rm -rf /${VIRTUAL_HOST_ROOT}/public/app/composer.lock
rm -rf /${VIRTUAL_HOST_ROOT}/public/app/composer.json
rm -rf /${VIRTUAL_HOST_ROOT}/public/app/autoload.php

# Install slim 
composer require slim/slim "^2.6.1" --working-dir=/${VIRTUAL_HOST_ROOT}/public/app
mkdir /${VIRTUAL_HOST_ROOT}/public/app/composer
mkdir /${VIRTUAL_HOST_ROOT}/public/app/slim
cp -af /${VIRTUAL_HOST_ROOT}/public/app/vendor/composer/* /${VIRTUAL_HOST_ROOT}/public/app/composer
cp -af /${VIRTUAL_HOST_ROOT}/public/app/vendor/slim/* /${VIRTUAL_HOST_ROOT}/public/app/slim
cp -af /${VIRTUAL_HOST_ROOT}/public/app/vendor/autoload.php /${VIRTUAL_HOST_ROOT}/public/app/autoload.php
rm -rf /${VIRTUAL_HOST_ROOT}/public/app/vendor

cd /home

# Install parsedown.php
wget -O /home/temp.zip "https://github.com/erusev/parsedown/archive/refs/tags/1.7.3.zip" 
unzip /home/temp.zip
mv parsedown-1.7.3/Parsedown.php /${VIRTUAL_HOST_ROOT}/public/app/parsedown.php
rm /home/temp.zip

/usr/sbin/apache2ctl -D FOREGROUND

