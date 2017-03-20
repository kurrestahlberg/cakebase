FROM alpine:latest

RUN apk update && apk upgrade \
    && apk add \
        php7 \
        nginx \
        supervisor \
        php7-pdo_mysql \
        php7-mcrypt \
        php7-fpm \
        php7-iconv \
        php7-mbstring \
        php7-opcache \
        curl \
        php7-json \
        php7-phar \
        php7-openssl \
        php7-zip\
        php7-session \
        php7-apcu \
        php7-ctype \
        bash \
        ca-certificates \
        php7-zlib \
        php7-gd \
        php7-xml \
        php7-dom \
    && mkdir -p /usr/local/composer/bin \
    && curl -sS https://getcomposer.org/installer \
        | /usr/bin/php7 -- --install-dir=/usr/local/composer/bin/ --filename=composer \
    && apk del gcc musl-dev linux-headers libffi-dev augeas-dev python-dev curl \
    && rm -rf /var/www/* \
    /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

expose 80
