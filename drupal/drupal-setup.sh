#!/bin/sh
set -ex

# extract wordpress version
DRUPAL_VERSION=$1

# install required software
apk add --no-cache \
  coreutils \
  curl \
  mariadb-client \
  php5-json=$PHP_VERSION \
  php5-dom=$PHP_VERSION \
  php5-pdo=$PHP_VERSION \
  php5-xml=$PHP_VERSION \
  php5-pdo_mysql=$PHP_VERSION

# download and extract drupal archive
curl -fsSL https://ftp.drupal.org/files/projects/drupal-$DRUPAL_VERSION.tar.gz | tar zx --strip-components=1

# Sets up drupal specific permissions
mkdir -p sites/default/files
chown -R apache:apache sites/default/files
