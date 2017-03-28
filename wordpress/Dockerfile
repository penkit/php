FROM penkit/alpine:3.5

# php setup
ARG PHP_VERSION
COPY php-setup.sh /usr/local/sbin/
RUN php-setup.sh ${PHP_VERSION}
WORKDIR /var/www/localhost/htdocs

# wordpress setup
ARG WP_VERSION
COPY wordpress/wp-setup.sh /usr/local/sbin/
RUN wp-setup.sh ${WP_VERSION}

# copy licenses
COPY PHP_LICENSE /
COPY wordpress/WORDPRESS_LICENSE /

# configuration
COPY httpd.conf /etc/apache2/
COPY wordpress/db_dump/penkit-wp-$WP_VERSION.sql /usr/local/lib/penkit-wp.sql

# application setup
COPY wordpress/wp-config.php .
COPY php-entrypoint.sh /usr/local/sbin/
COPY wordpress/wp-entrypoint.sh /usr/local/sbin/
COPY wordpress/wait-for-it.sh /usr/local/sbin/
ENTRYPOINT ["/usr/local/sbin/wp-entrypoint.sh"]
CMD []
