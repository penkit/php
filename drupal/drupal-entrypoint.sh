#!/bin/sh
set -e

# wait for mysql to be available
wait-for-it.sh $DRUPAL_DB_HOST:$DRUPAL_DB_PORT -t 45

# preload the drupal database
mysql -h $DRUPAL_DB_HOST -u $DRUPAL_DB_USER -p$DRUPAL_DB_PASS $DRUPAL_DB_NAME < /usr/local/lib/penkit-drupal.sql

exec php-entrypoint.sh
