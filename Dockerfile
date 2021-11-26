FROM 1and1internet/php-build-environment:7.3
MAINTAINER developmentteamserenity@fasthosts.com

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      php7.3-xdebug \
    && apt-get autoremove --purge -y \
    && rm -rf /var/lib/apt/lists/*

USER 1000
