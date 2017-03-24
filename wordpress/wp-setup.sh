#!/bin/sh
set -ex

# extract wordpress version
WP_VERSION=$1

# install required software
apk add --no-cache \
  curl \
  mariadb-client

#docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
#docker-php-ext-install gd mysqli opcache; \

# download and extract wordpress archive
curl -fsSL https://wordpress.org/wordpress-$WP_VERSION.tar.gz | tar zx --strip-components=1
