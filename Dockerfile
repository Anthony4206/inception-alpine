FROM nginx
COPY etc/nginx/ssl/ /etc/nginx/ssl/
COPY default.conf /etc/nginx/conf.d/default.conf
