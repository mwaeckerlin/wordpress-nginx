FROM mwaeckerlin/very-base as wordpress
ADD https://wordpress.org/latest.tar.gz /tmp/wordpress.tar.gz
RUN mkdir -p /root && tar xzf /tmp/wordpress.tar.gz -C /root && mv /root/wordpress /root/app

FROM mwaeckerlin/nginx as config
COPY conf /etc/nginx

FROM mwaeckerlin/nginx
COPY --from=config /etc/nginx /etc/nginx
COPY --from=wordpress /root/app /app
ENV PHP_FPM_HOST="wordpress-php-fpm"
ENV PHP_FPM_PORT="9000"
WORKDIR /app
