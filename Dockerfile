FROM php:7.2-apache

# edit the following line to change document root. (default is /html as stated in .yml file)
ENV APACHE_DOCUMENT_ROOT=/var/www/html

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN apt-get update && apt-get upgrade -y

RUN apt-get install zip unzip -y

RUN a2enmod rewrite

RUN docker-php-ext-install pdo pdo_mysql bcmath

COPY --from=composer /usr/bin/composer /usr/bin/composer
