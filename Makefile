.DEFAULT_GOAL := spec

init:
	make build
	@cp config/database.yml.sample config/database.yml

clean:
	docker volume rm flatshare_app_postgres

build:
	docker-compose -f docker-compose.yml build

bundle:
	make build
	docker-compose -f docker-compose.yml run --rm app bundle

start-db:
	docker-compose -f docker-compose.yml up -d db

stop-db:
	docker-compose -f docker-compose.yml stop db

create-db:
	docker-compose -f docker-compose.yml run --rm app rails db:drop
	docker-compose -f docker-compose.yml run --rm app rails db:create

migrate-db:
	docker-compose -f docker-compose.yml run --rm app rails db:migrate

seed-db:
	docker-compose -f docker-compose.yml run --rm app rails db:seed

dev:
	docker-compose -f docker-compose.yml run --rm app sh

spec:
	docker-compose -f docker-compose.yml run --rm app sh -c 'RAILS_ENV=test rake'

start:
	docker-compose -f docker-compose.yml up -d

stop:
	docker-compose -f docker-compose.yml down

restart:
	make stop
	make start

setup:
	make stop
	make init
	make bundle
	make start-db
	make create-db
	make migrate-db
	make seed-db
	make stop-db

#production
generate_env:
	@rm -f .env.production
	@touch .env.production
	docker-compose -f docker-compose-prod.yml down
	docker-compose -f docker-compose-base.yml run app ruby bin/generate_password > .env.production
	@echo RAILS_ENV=production >> .env.production

deploy:
	docker-compose -f docker-compose-prod.yml up -d --build
	docker-compose -f docker-compose-prod.yml exec app bundle exec rails db:create
	docker-compose -f docker-compose-prod.yml exec app bundle exec rails db:migrate
	docker-compose -f docker-compose-prod.yml exec app bundle exec rails assets:precompile
	docker-compose -f docker-compose-prod.yml restart

bash:
	docker-compose -f docker-compose-prod.yml run --rm app bash

console:
	docker-compose -f docker-compose-prod.yml exec app bundle exec rails c
