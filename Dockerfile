FROM nginx

RUN apt-get update && apt-get install -y openssl
RUN apt-get update && apt-get upgrade openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 \
	-keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=PACA/L=Nice/O=42/OU=alevasse/CN=alevasse/"

COPY default.conf /etc/nginx/conf.d/default.conf
COPY ./www /var/www/html

CMD ["nginx", "-g", "daemon off;"]