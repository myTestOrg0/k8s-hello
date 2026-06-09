FROM nginx:alpine-slim

RUN sed -ri 's|access_log\s+.*;|access_log /dev/stdout;|' /etc/nginx/nginx.conf \
 && sed -ri 's|error_log\s+.*;|error_log /dev/stderr;|' /etc/nginx/nginx.conf \
 && rm -f /etc/nginx/conf.d/default.conf \
 && chown -R nginx:nginx /var/cache/nginx /var/run /etc/nginx/conf.d /tmp

COPY hello.conf /etc/nginx/conf.d/hello.conf
COPY metrics.conf /etc/nginx/conf.d/metrics.conf
COPY index.html /var/www/html/index.html
COPY metrics.txt /var/www/html/metrics.txt

USER nginx

CMD ["nginx", "-g", "daemon off;"]
