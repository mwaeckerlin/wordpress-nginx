FROM mwaeckerlin/very-base AS wordpress
WORKDIR /app
ADD https://wordpress.org/latest.tar.gz /tmp/wordpress.tar.gz
RUN tar xzf /tmp/wordpress.tar.gz --strip-components=1
RUN find . -name '*.php' -exec sh -c "rm {} && touch {}" \; # Remove all PHP files for security
RUN ${ALLOW_USER} wp-content

FROM mwaeckerlin/nginx
ENV PHP_FPM_HOST="wordpress-php-fpm"
COPY --from=wordpress /app /app
