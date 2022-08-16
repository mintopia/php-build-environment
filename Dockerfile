FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php7.2-bcmath \
      php7.2-bz2 \
      php7.2-cli \
      php7.2-curl \
      php7.2-gd \
      php7.2-intl \
      php7.2-json \
      php7.2-ldap \
      php7.2-mbstring \
      php7.2-mysql \
      php7.2-opcache \
      php7.2-readline \
      php7.2-sqlite3 \
      php7.2-xml \
      php7.2-xmlrpc \
      php7.2-zip \
      php7.2-amqp \
      php7.2-redis \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

COPY --chown=1000:1000 --from=composer:2.4 /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/tmp/.composer/vendor/bin

RUN composer global require psy/psysh && composer clear-cache
