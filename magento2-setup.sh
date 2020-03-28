cd /var/www/html
php bin/magento setup:install \
  --db-host db --db-name magento2 --db-user magento2 --db-password magento2  --admin-user admin --timezone 'Europe/London' --currency EUR --use-rewrites 1 --cleanup-database \
  --backend-frontname admin --admin-firstname Admin --admin-lastname Admin --admin-email 'admin@email.com' --admin-password 'admin2email.com' --base-url $BASE_URL --language en_US \
  --session-save=redis --session-save-redis-host=sessions --session-save-redis-port=6379 --session-save-redis-db=0 --session-save-redis-password='' \
  --cache-backend=redis --cache-backend-redis-server=cache --cache-backend-redis-port=6379 --cache-backend-redis-db=0 \
  --page-cache=redis --page-cache-redis-server=cache --page-cache-redis-port=6379 --page-cache-redis-db=1 \
  --use-secure=0 --base-url-secure=0 --use-secure-admin=0
