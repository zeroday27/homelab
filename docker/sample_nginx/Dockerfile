# Use Alpine Linux as the base image
FROM alpine:latest

# Set the maintainer label
LABEL maintainer="Nico <kokonaingcloud@gmail.com>"

# Install Nginx and clean up unnecessary files
RUN apk update \
    && apk add nginx \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /run/nginx

# Copy custom Nginx configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

