# Optimized image with Nginx and PHP-FPM
FROM trafex/php-nginx:latest

USER root

# Install PHP extensions for PostgreSQL connectivity
RUN apk add --no-cache \
    php-pdo \
    php-pdo_pgsql \
    php-pgsql

# Ensure extensions are properly linked
RUN cp /etc/php*/conf.d/* /etc/php*/php.ini 2>/dev/null || true

# Switch back to non-root user for security
USER nobody
WORKDIR /var/www/html
COPY index.php .

EXPOSE 8080
