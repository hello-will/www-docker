FROM debian:stretch-slim

ENV DOMAIN_NAME=example.com

COPY docker-entrypoint.sh /
RUN set -x \
    && chmod +x /docker-entrypoint.sh \
    && apt update && apt install -y --no-install-recommends net-tools vim unzip wget nginx-light php7.0-fpm mariadb-server php7.0-mysql\
    && apt autoremove && apt autoclean && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /etc/nginx/certs
COPY nginx.conf /etc/nginx/
COPY default    /etc/nginx/sites-available/

ENTRYPOINT ["/docker-entrypoint.sh"]

