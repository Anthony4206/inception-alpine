FROM alpine:3.17.3

RUN apk add --no-cache mariadb mariadb-client

COPY ./script.sh /vr/local/bin/
COPY ./database.sql /var/local/bin/

RUN chmod +x /var/local/bin/script.sh

CMD ["mysqld", "--bind-adress=0.0.0.0"]