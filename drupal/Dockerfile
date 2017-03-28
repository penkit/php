FROM penkit/alpine:3.5

# php setup
ARG PHP_VERSION
COPY php-setup.sh /usr/local/sbin/
RUN php-setup.sh ${PHP_VERSION}

WORKDIR /var/www/localhost/htdocs

# drupal setup
ARG DRUPAL_VERSION
COPY drupal/drupal-setup.sh /usr/local/sbin/
RUN drupal-setup.sh ${DRUPAL_VERSION}

# copy licenses
COPY PHP_LICENSE /
COPY drupal/DRUPAL_LICENSE /

# configuration
COPY httpd.conf /etc/apache2/
COPY drupal/db_dump/penkit-drupal-$DRUPAL_VERSION.sql /usr/local/lib/penkit-drupal.sql

# application setup
COPY drupal/settings.php ./sites/default/settings.php
COPY php-entrypoint.sh /usr/local/sbin/
COPY drupal/drupal-entrypoint.sh /usr/local/sbin/
COPY drupal/wait-for-it.sh /usr/local/sbin/
COPY drupal/php.ini /etc/php5/php.ini
ENTRYPOINT ["/usr/local/sbin/drupal-entrypoint.sh"]
CMD []
