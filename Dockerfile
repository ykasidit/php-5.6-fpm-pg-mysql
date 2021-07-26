FROM php:5.6-fpm
RUN apt-get update
RUN apt-get update
RUN apt-get install -y libpq-dev zlib1g-dev
RUN docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install mysql mysqli pdo_mysql
RUN docker-php-ext-install zip

# install phpredis extension
ENV PHPREDIS_VERSION 2.2.8

ADD https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz /tmp/redis.tar.gz
RUN tar xzf /tmp/redis.tar.gz -C /tmp \
    && mkdir -p /usr/src/php/ext \
    && mv /tmp/phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis \
    && rm -rf /usr/src/php/ext/redis