#!/bin/bash
set -e

echo "Starting Laravel container..."

# Run Laravel migrations
echo "Running Laravel migrations..."
php artisan migrate --force || echo "Migration failed, continuing..."

# Clear & cache config
php artisan config:clear
php artisan config:cache

# Start Supervisor (long-running processes)
echo "Starting Supervisor..."
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
