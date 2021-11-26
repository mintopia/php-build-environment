FROM 1and1internet/php-build-environment:7.0
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php7.0-xdebug \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000
