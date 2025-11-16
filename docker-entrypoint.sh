#!/bin/bash
set -e

echo "Starting Laravel container..."

# Run Laravel migrations with catch for PostgreSQL bigint issue
echo "Running Laravel migrations..."
php artisan migrate --force || echo "Some migrations failed, check device_id column for PostgreSQL bigint cast"

# Optional: clear & cache config
echo "Clearing and caching config..."
php artisan config:clear
php artisan config:cache

# Start Supervisor
echo "Starting Supervisor..."
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

