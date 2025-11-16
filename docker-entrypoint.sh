#!/bin/bash
set -e

# Optional: print logs to see progress
echo "Starting Laravel container..."

# Run Laravel migrations
echo "Running Laravel migrations..."
php artisan migrate --force

# Optional: clear & cache config (helps in some cases)
echo "Clearing and caching config..."
php artisan config:clear
php artisan config:cache

# Start Supervisor (this runs Nginx + PHP-FPM + Laravel workers)
echo "Starting Supervisor..."
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
