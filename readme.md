# PHP 8.1 Build Environment

This image contains a light image based on ubuntu 20.04 LTS and includes the latest PHP 8.1 CLI binaries from the [Ondřej Surý](https://launchpad.net/~ondrej/+archive/ubuntu/php) PPA. It is built on top of [1and1internet/php-build-environment-base](https://cloud.docker.com/u/1and1internet/repository/docker/1and1internet/php-build-environment-base).

It has the following extensions installed:

1. BCMath
1. Bz2
1. Curl
1. GD
1. GMP
1. IMAP
1. internationalisation
1. LDAP
1. MBString
1. MySQL (both PDO and mysqli)
1. ODBC
1. Opcache
1. Postgresql
1. Readline
1. Sqlite 3
1. XML
1. XSL
1. Zip

It also includes common tools used to build and run PHP applications:

1. Composer
1. curl
1. Git
1. jq (Command line JSON parser)
1. MySQL Client Tools
1. Unzip

It also includes a couple of text editors for convenience:

1. Nano
1. Vim

Lastly, it also has the latest stable release of [PsySH](https://psysh.org/) - a PHP REPL that's useful for debugging.

The parent image is rebuilt nightly, and this image tracks changes in it. So this image should usually contain the latest fixes and updates.