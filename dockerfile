FROM debian:wheezy
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*
RUN echo "<h1>Curso Docker</h1>" | \
    tee /usr/share/nginx/www/index.html
VOLUME ["/var/cache/nginx"]
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
HEALTHCHECK --interval=5m --timeouts=3s CMD curl -f http://localhost/ || exit 777 CMD "nginx", "daemon off;"
