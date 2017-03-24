#!/bin/sh
set -e

# wait for mysql to be available
wait-for-it.sh -t 45 $WP_DB_HOST:$WP_DB_PORT

# preload the wordpress database
mysql -h $WP_DB_HOST -u $WP_DB_USER -p$WP_DB_PASS $WP_DB_NAME < /usr/local/lib/penkit-wp.sql

exec php-entrypoint.sh
