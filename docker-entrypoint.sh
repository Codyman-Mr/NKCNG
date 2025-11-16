#!/bin/bash
set -e

echo "Starting Laravel container..."

# Run migrations (automatic)
echo "Running Laravel migrations..."
php artisan migrate --force

# Clear and cache config
echo "Clearing and caching config..."
php artisan config:clear
php artisan config:cache

# Optional: run other artisan commands if needed
# php artisan db:seed --force

# Start Supervisor (Nginx + PHP-FPM + Laravel workers)
echo "Starting Supervisor..."
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
