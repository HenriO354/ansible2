FROM php:8.0-apache
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get upgrade -y
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
COPY ./src/config.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite && service apache2 restart