set -e
rm -r --force ./m2i
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.3.0 m2i
mv ./m2i/* /var/www/html
cd /var/www/html
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chown -R :www-data .
chmod u+x bin/magento
