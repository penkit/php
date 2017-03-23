FROM penkit/alpine:3.5

# php setup
ARG PHP_VERSION
COPY php-setup.sh /usr/local/sbin/
RUN php-setup.sh ${PHP_VERSION}
COPY httpd.conf /etc/apache2/
COPY PHP_LICENSE /

# application setup
WORKDIR /var/www/localhost/htdocs
COPY php-entrypoint.sh /usr/local/sbin/
ENTRYPOINT ["/usr/local/sbin/php-entrypoint.sh"]
CMD []

# application code
COPY custom/index.php .
