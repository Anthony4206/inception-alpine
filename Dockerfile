FROM nginx
COPY default.conf /etc/nginx/conf.d/default.conf
COPY ssl/ /etc/nginx/ssl/
