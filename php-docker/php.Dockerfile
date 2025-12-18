# Latest stable at last update.  You can also use php:fpm to auto-update,
# or php:fpm-alpine to auto-update with a smaller image size (but no bash).
FROM php:8.5.0-fpm-alpine

# Install git and zip
RUN apt-get update && \
    apt-get install -y git zip unzip

# PIE is used for installing extensions.  Composer is used for dependency management.
RUN curl --silent --show-error https://github.com/php/pie/releases/download/1.3.2/pie.phar | php && \
    mv pie.phar /usr/local/bin/pie

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Uncomment to have mysqli extension installed and enabled
# RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
