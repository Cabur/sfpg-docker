FROM php:7.0-apache

RUN echo "[PHP]\nmemory_limit = 1024M" > /usr/local/etc/php/php.ini

WORKDIR /var/www/html/

RUN apt-get update && yes | apt-get install pwgen unzip wget libpng-dev libjpeg-dev

RUN wget https://sye.dk/sfpg/Single_File_PHP_Gallery_4.7.1.zip \
    && unzip Single_File_PHP_Gallery_4.7.1.zip \
    && mkdir _sfpg_data \
    && chown www-data:www-data _sfpg_data \
    && sed -i "s/define('GALLERY_ROOT', '.\\/')/define('GALLERY_ROOT', '.\\/images\\/')/" index.php \
    && export PHRASE=$(pwgen -n1 40) \
    && sed -i "s/define('SECURITY_PHRASE', '')/define('SECURITY_PHRASE', '${PHRASE}')/" index.php \
    && docker-php-ext-configure gd --with-png-dir=/usr/include --with-jpeg-dir=/usr/include \
    && docker-php-ext-install -j$(nproc) gd

VOLUME /var/www/html
