FROM php:7.2-apache

RUN a2enmod rewrite

RUN docker-php-ext-install pdo pdo_mysql bcmath
