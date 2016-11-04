FROM alpine:edge

RUN cat /etc/apk/repositories \
    && apk update && apk upgrade \
    && apk add php7 nginx supervisor php7-pdo_mysql php7-mcrypt php7-fpm \
        php7-mbstring php7-opcache curl php7-json php7-phar php7-openssl \
    && mkdir -p /usr/local/composer/bin \
    && curl -sS https://getcomposer.org/installer \
        | /usr/bin/php7 -- --install-dir=/usr/local/composer/bin/ --filename=composer \
    && apk del gcc musl-dev linux-headers libffi-dev augeas-dev python-dev curl \
    && rm -rf /var/www/*
