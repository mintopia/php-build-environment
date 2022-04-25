FROM 1and1internet/php-build-environment:base
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php7.3-bcmath \
      php7.3-bz2 \
      php7.3-cli \
      php7.3-curl \
      php7.3-gd \
      php7.3-intl \
      php7.3-json \
      php7.3-ldap \
      php7.3-mbstring \
      php7.3-mysql \
      php7.3-opcache \
      php7.3-readline \
      php7.3-sqlite3 \
      php7.3-xml \
      php7.3-xmlrpc \
      php7.3-zip \
      php7.3-amqp \
      php7.3-redis \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000

COPY --chown=1000:1000 --from=composer:2.3 /usr/bin/composer /usr/bin/composer

ENV PATH $PATH:/tmp/.composer/vendor/bin

RUN composer global require psy/psysh && composer clear-cache
