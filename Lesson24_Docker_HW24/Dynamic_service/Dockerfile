FROM php:8.2-fpm

RUN apt update && apt-get install -y \
	libpq-dev \
	&& docker-php-ext-install pdo pdo_pgsql
WORKDIR /app
