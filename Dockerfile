FROM php:7.2-apache

RUN a2enmod rewrite

RUN docker-php-ext-install pdo pdo_mysql bcmath

COPY --from=composer /usr/bin/composer /usr/bin/composer
