# Changelog

- 2026-10-22 **1.0.2**
    - `PHP_FPM_HOST` defaults to `wordpress-php-fpm`, the service name of the examples, instead of `php-fpm`; a stack whose PHP service is named `php-fpm` sets `PHP_FPM_HOST: php-fpm`

- 2026-09-26 **1.0.1**
    - The image is published for amd64 and arm64 under one tag, built, tested and published automatically on every change and every week
