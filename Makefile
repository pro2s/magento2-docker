all: up install setup

up:
	docker-compose up -d

stop:
	docker-compose stop

cron-up:
	docker-compose up cron -d

cron-stop:
	docker-compose stop cron

bash:
	docker-compose exec apache bash

upgrade: setup-upgrade flush

setup-upgrade:
	docker-compose exec apache bash -c "bin/magento setup:upgrade"

upgrade-di:  setup-upgrade-di flush

setup-upgrade-di:
	docker-compose exec apache bash -c "bin/magento setup:di:compile"

static-deploy:
	docker-compose exec apache bash -c "bin/magento setup:static-content:deploy"

flush:
	docker-compose exec apache bash -c "bin/magento cache:flush"

install:
	docker-compose exec apache bash -c "sh /var/magento2-install.sh"

setup:
	docker-compose exec apache bash -c "sh /var/magento2-setup.sh"

deploy:
	docker-compose exec apache bash -c "bin/magento dev:source-theme:deploy" \
    docker-compose exec apache bash -c "bin/magento setup:static-content:deploy"

fix:
	docker-compose exec apache bash -c "chown -R :www-data ." \

sample:
	docker-compose exec apache bash -c "php -d memory_limit=-1 bin/magento sampledata:deploy"

redis-cli:
	docker-compose exec cache redis-cli

varnishadm:
	docker-compose exec varnish varnishadm

varnishncsa:
	docker-compose exec varnish varnishncsa
