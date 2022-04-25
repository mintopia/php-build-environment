FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php8.0-amqp \
      php8.0-bcmath \
      php8.0-bz2 \
      php8.0-cli \
      php8.0-curl \
      php8.0-gd \
      php8.0-gmp \
      php8.0-imap \
      php8.0-intl \
      php8.0-ldap \
      php8.0-mbstring \
      php8.0-memcached \
      php8.0-mysql \
      php8.0-odbc \
      php8.0-opcache \
      php8.0-pgsql \
      php8.0-readlin \
      php8.0-redis \
      php8.0-sqlite3 \
      php8.0-xml \
      php8.0-xmlrpc \
      php8.0-xsl \
      php8.0-zip \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

COPY --chown=1000:1000 --from=composer:2.3 /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/tmp/.composer/vendor/bin

RUN composer global require psy/psysh && composer clear-cache