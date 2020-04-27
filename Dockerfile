FROM bearstech/nginx:1.14

USER root
RUN set -eux \
    &&  apt-get update \
    &&  apt-get install -y \
                libnginx-mod-http-lua \
                lua-nginx-string \
    &&  apt-get clean \
    &&  rm -rf /var/lib/apt/lists/*

USER www-data

COPY nginx.conf /etc/nginx/sites-enabled/default
