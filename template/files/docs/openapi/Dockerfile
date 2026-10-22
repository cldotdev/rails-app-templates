# syntax=docker/dockerfile:1
FROM nginx:1.31.8-alpine
WORKDIR /app
COPY ./src/ .
COPY <<EOF /etc/nginx/nginx.conf
user             nginx;
worker_processes 1;
error_log        /var/log/nginx/error.log warn;
pid              /var/run/nginx.pid;

events {
  worker_connections 512;
}

http {
  server_tokens      off;
  include            /etc/nginx/mime.types;
  default_type       application/octet-stream;

  # Logging
  log_format         main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                           '\$status \$body_bytes_sent "\$http_referer" '
                           '"\$http_user_agent" "\$http_x_forwarded_for"';
  access_log         /var/log/nginx/access.log  main;

  # Performance optimizations
  sendfile           on;
  sendfile_max_chunk 1m;
  tcp_nopush         on;
  tcp_nodelay        on;
  keepalive_timeout  65;

  # Compression
  gzip               on;
  gzip_vary          on;
  gzip_types         text/plain text/css text/xml text/javascript
                     application/json application/javascript application/xml+rss
                     application/x-yaml text/yaml;

  server {
    listen       80;
    server_name  localhost;
    root         /app;
    index        index.html;

    absolute_redirect off;
    add_header_inherit merge;

    # The peer is the tunnel container on a Docker network (Docker's default address pools).
    real_ip_header   CF-Connecting-IP;
    set_real_ip_from 172.16.0.0/12;
    set_real_ip_from 192.168.0.0/16;

    # Always revalidate API documentation
    add_header Cache-Control 'no-cache';

    # Enable CORS for API documentation
    add_header Access-Control-Allow-Origin '*';
    add_header Access-Control-Allow-Methods 'GET, OPTIONS';
    add_header Access-Control-Allow-Headers 'Content-Type';

    # Proper MIME type for YAML files
    location ~ \\.ya?ml\$ {
      types {
        text/yaml yaml yml;
      }
    }

    location / {
      try_files \$uri \$uri/ =404;
    }
  }
}
EOF

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
