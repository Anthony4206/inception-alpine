FROM alpine:3.17.3

RUN apk add --no-cache wget bash php7 php7-fmp php7-mysqli php7-json php7-session \
	&& wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz \
	&& tar -xvzf /tmp/wordpress.tar.gz -C /var/www/html/ --strip-components=1 \
	&& rm /tmp/wordpress.tar.gz

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY wordpress/ /var/www/html/

RUN mkdir -p /run/php

COPY ./tools/script.sh /usr/local/bin
RUN chmod +x /usr/local/bin/script.sh
ENTRYPOINT ["/usr/local/bin/script.sh"]

RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

CMD ["php-fpm7", "-F"]