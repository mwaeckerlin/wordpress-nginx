# Minimalistic Secure NGINX Webserver Docker Image for WordPress

This image is about 86MB in size and has no shell, so it is small, fast and secure.

Implements an NGINX WordPress server based on [mwaeckerlin/nginx].

Only used as one part in [mwaeckerlin/wordpress], see there for more information.

This is the most lean and secure image for an NGINX WordPress server:
 - extremely small size, minimalistic dependencies
 - no shell, only the server command
 - small attack surface
 - starts as non root user


## Port

Exposes nginx on port `8080`.


## Configuration

If [mwaeckerlin/wordpress-php-fpm] is not in host `php-fpm` you must set `PHP_FPM_HOST`.


## Persistence and Volume

- Serves `/app`; for WordPress, plugins/themes/uploads live in `/app/wp-content`.
- Shared volume `wp-content` must be mounted in [mwaeckerlin/wordpress-nginx] and [mwaeckerlin/wordpress-php-fpm] so both see the same files.


[mwaeckerlin/nginx]: https://github.com/mwaeckerlin/nginx "NGINX base image"
[mwaeckerlin/wordpress-php-fpm]: https://github.com/mwaeckerlin/wordpress-php-fpm "WordPress PHP-FPM backend"
[mwaeckerlin/wordpress]: https://github.com/mwaeckerlin/wordpress "WordPress monorepo"
