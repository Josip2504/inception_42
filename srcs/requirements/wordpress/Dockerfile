FROM wordpress:6.4-php8.2-fpm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    less \
    vim-tiny && \
    rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/html