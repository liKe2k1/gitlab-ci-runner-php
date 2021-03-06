#
# Dockerfile for gitlab-ci-runner-php
#
FROM php:latest

MAINTAINER Tobias Ehrig <me@t0by.eu>

ENV PHPMODS \
	mbstring \
	mcrypt \
	pdo_mysql \
	pdo_pgsql \
	pgsql \
	curl \
	json \
	intl \
	gd \
	xml \
	bz2 \
	ldap \
	opcache

ENV DEBS \
	phpunit \
	git \
	zip \
	libmcrypt-dev \
	libpq-dev \
	libcurl4-gnutls-dev \
	libicu-dev \
	libvpx-dev \
	libjpeg-dev \
	libpng-dev \
	libxpm-dev \
	zlib1g-dev \
	libfreetype6-dev \
	libxml2-dev \
	libexpat1-dev \
	libbz2-dev \
	libgmp3-dev \
	libldap2-dev \
	unixodbc-dev \
	libsqlite3-dev \
	libaspell-dev \
	libsnmp-dev \
	libpcre3-dev \
	libtidy-dev \
	libldb-dev \
	libldap2-dev

RUN set -xe \
	&& apt-get update -yqq \
	&& apt-get install -y $DEBS \
	&& docker-php-ext-install $PHPMODS \
	&& rm -r /var/lib/apt/lists/* 
	
RUN curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer
