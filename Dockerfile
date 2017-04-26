#
# Dockerfile for gitlab-symfony
#
FROM php:latest

MAINTAINER Tobias Ehrig <tobias.ehrig@hermesworld.com>

RUN echo "deb http://ftp.hosteurope.de/mirror/packages.dotdeb.org/ stable all" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.hosteurope.de/mirror/packages.dotdeb.org/ stable all" >> /etc/apt/sources.list

ADD  https://www.dotdeb.org/dotdeb.gpg /tmp/dotdeb.gpg
RUN set -xe \
	&& apt-key add /tmp/dotdeb.gpg

ENV PHPMODS \
	php7.1-mbstring \
	php7.1-mcrypt \
	php7.1-pdo-mysql \
	php7.1-curl \
	php7.1-json \
	php7.1-intl \
	php7.1-gd \
	php7.1-xml \
	php7.1-bz2 \
	php7.1-opcache

RUN set -xe && \
	apt-get update -yqq && \
	apt-get install -y \ 
	phpunit \
	$PHP_MODS \
	--no-install-recommends && \
	rm -r /var/Lib/apt/lists/* && \
	echo "de_DE.UTF-8 UTF-8" > /etc/locale.gen && \
	localegen
	

ENTRYPOINT ["docker-php-entrypoint"]
CMD ["php", "-a"]