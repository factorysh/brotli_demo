FROM bearstech/nginx:1.14

USER root
RUN set -eux \
    &&  apt-get update \
    &&  apt-get install -y \
                libnginx-mod-http-lua \
                lua-nginx-string \
    &&  apt-get clean \
    &&  rm -rf /var/lib/apt/lists/* \
    && printf '%s\n%s\n' "include /etc/nginx/modules-enabled/*.conf;" "$(cat /etc/nginx/nginx.conf)" > /etc/nginx/nginx.conf

USER www-data

COPY nginx.conf /etc/nginx/sites-enabled/default
