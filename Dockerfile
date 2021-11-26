FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php7.4-bcmath \
      php7.4-bz2 \
      php7.4-cli \
      php7.4-curl \
      php7.4-gd \
      php7.4-gmp \
      php7.4-imap \
      php7.4-intl \
      php7.4-json \
      php7.4-ldap \
      php7.4-mbstring \
      php7.4-mysql \
      php7.4-odbc \
      php7.4-opcache \
      php7.4-pgsql \
      php7.4-readline \
      php7.4-sqlite3 \
      php7.4-xdebug \
      php7.4-xml \
      php7.4-xsl \
      php7.4-zip \
      php7.4-amqp \
      php7.4-redis \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

ENV PATH $PATH:/tmp/.composer/vendor/bin

RUN composer global require psy/psysh && composer clear-cache

