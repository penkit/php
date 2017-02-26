FROM php:5.6-apache

WORKDIR /var/www/html

RUN apt-get update; \
    apt-get install -y libjpeg-dev \
      libpng12-dev; \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install gd mysqli opcache; \
    service apache2 restart;

EXPOSE 80

COPY index.php .