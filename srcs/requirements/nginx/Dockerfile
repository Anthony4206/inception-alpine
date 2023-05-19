FROM nginx

RUN apt-get update && apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 \
	-keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=PACA/L=Nice/O=42/OU=alevasse/CN=alevasse/"

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY tools/www /var/www/html

CMD ["nginx", "-g", "daemon off;"]