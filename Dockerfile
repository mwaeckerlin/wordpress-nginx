FROM mwaeckerlin/very-base AS wordpress
WORKDIR /app
ADD https://wordpress.org/latest.tar.gz /tmp/wordpress.tar.gz
RUN tar xzf /tmp/wordpress.tar.gz --strip-components=1
RUN ${ALLOW_USER} wp-content

FROM mwaeckerlin/nginx
COPY --from=wordpress /app /app
