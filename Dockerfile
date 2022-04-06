FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php8.1-amqp \
      php8.1-bcmath \
      php8.1-bz2 \
      php8.1-cli \
      php8.1-curl \
      php8.1-gd \
      php8.1-gmp \
      php8.1-imap \
      php8.1-intl \
      php8.1-ldap \
      php8.1-mbstring \
      php8.1-mysql \
      php8.1-odbc \
      php8.1-opcache \
      php8.1-pgsql \
      php8.1-readline \
      php8.1-redis \
      php8.1-sqlite3 \
      php8.1-xml \
      php8.1-xsl \
      php8.1-zip \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

COPY --chown=1000:1000 --from=composer:2.3 /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/tmp/.composer/vendor/bin

RUN composer global require psy/psysh && composer clear-cache