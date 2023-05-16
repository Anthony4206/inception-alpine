FROM nginx
COPY default.conf /etc/nginx/conf.d/default.conf
COPY /etc/nginx/ssl/ /etc/nginx/ssl/
