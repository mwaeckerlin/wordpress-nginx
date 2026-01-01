FROM mwaeckerlin/very-base as wordpress
ADD https://wordpress.org/latest.tar.gz /tmp/wordpress.tar.gz
RUN mkdir -p /root && tar xzf /tmp/wordpress.tar.gz -C /root && mv /root/wordpress /root/app

FROM mwaeckerlin/nginx
COPY --from=wordpress /root/app /app
