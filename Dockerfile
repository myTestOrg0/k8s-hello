FROM debian:bookworm-slim

RUN /bin/true \
  && apt-get update \
  && apt-get -y install --no-install-recommends \
      nginx="*" \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN sed -ri 's/^\s*(listen\s+.*;)/# \1/' /etc/nginx/sites-available/default && \
 sed -ri 's|access_log\s+.*;|access_log /dev/stdout;|' /etc/nginx/nginx.conf && \
 sed -ri 's|error_log\s+.*;|error_log /dev/stderr;|' /etc/nginx/nginx.conf

USER 33:33

COPY hello.conf /etc/nginx/conf.d/hello.conf
COPY metrics.conf /etc/nginx/conf.d/metrics.conf
COPY index.html /var/www/html/index.html
COPY metrics.txt /var/www/html/metrics.txt

CMD ["nginx", "-g", "daemon off;"]
