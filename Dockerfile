# Use a lightweight web server image
FROM nginx:alpine

# Create a writable cache directory
RUN mkdir -p /tmp/nginx-cache && chmod 777 /tmp/nginx-cache

# Copy your HTML file to the appropriate directory
COPY ./index.html /usr/share/nginx/html/index.html

# Update the Nginx configuration
RUN sed -i 's|/var/cache/nginx|/tmp/nginx-cache|g' /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
