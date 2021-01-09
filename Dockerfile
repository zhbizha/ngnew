FROM ubuntu
# NEW FUCKIN STRING
RUN apt update && apt install --reinstall -y software-properties-common
# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define working directory.
WORKDIR /etc/nginx

COPY README.md /var/www/
# Define default command. MAZAFAKA
CMD ["nginx"]

# Expose ports.
EXPOSE 80
