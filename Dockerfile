FROM php:7.4-apache

RUN docker-php-ext-install mysqli

RUN unzip html.zip
COPY html /var/www/html
COPY flag.txt /flag.txt
RUN chown -R root:www-data /var/www/html
RUN chmod -R 775 /var/www/html
RUN a2enmod headers
RUN a2enmod rewrite

RUN /etc/init.d/apache2 restart
