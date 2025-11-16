#!/bin/bash
set -e

echo "Starting Laravel container..."

# Run Laravel migrations runtime
php artisan migrate --force || echo "Migration failed, continuing..."

# Clear & cache config
php artisan config:clear
php artisan config:cache

# Start Supervisor for nginx + php-fpm + workers
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
