FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php7.0-bcmath \
      php7.0-bz2 \
      php7.0-cli \
      php7.0-curl \
      php7.0-gd \
      php7.0-intl \
      php7.0-json \
      php7.0-ldap \
      php7.0-mbstring \
      php7.0-mysql \
      php7.0-opcache \
      php7.0-readline \
      php7.0-sqlite3 \
      php7.0-xml \
      php7.0-zip \
      php7.0-amqp \
      php7.0-redis \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

COPY --chown=1000:1000 --from=composer:2.2 /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/tmp/.composer/vendor/bin

RUN composer global require psy/psysh && composer clear-cache
