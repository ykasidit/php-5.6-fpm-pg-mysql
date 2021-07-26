FROM php:5.6-fpm
RUN apt-get update
RUN apt-get update
RUN apt-get install -y libpq-dev zlib1g-dev
RUN docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install mysql mysqli pdo_mysql
RUN docker-php-ext-install zip
