#!/bin/sh
set -ex

# extract php version
PHP_VERSION=$1

# create new system user
addgroup php
adduser -S -G php php

# install required packages
apk add --no-cache \
  apache2-utils \
  php5-apache2=$PHP_VERSION \
  php5-cli=$PHP_VERSION \
  php5-gd=$PHP_VERSION \
  php5-mysqli=$PHP_VERSION \
  php5-opcache=$PHP_VERSION

# create apache pid directory
mkdir -p /run/apache2
chown apache:apache /run/apache2

# remove default apache files
rm /etc/apache2/httpd.conf
rm /var/www/localhost/htdocs/index.html