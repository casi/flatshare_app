COMPOSE      = docker-compose -f docker-compose.yml
COMPOSE_PROD = docker-compose -f docker-compose-prod.yml

.DEFAULT_GOAL := spec

init:
	make build
	@cp config/database.yml.sample config/database.yml

clean:
	docker volume rm flatshare_app_db-data

build:
	$(COMPOSE) build

bundle:
	make build
	$(COMPOSE) run --rm app bundle

create-db:
	$(COMPOSE) run --rm app rails db:drop
	$(COMPOSE) run --rm app rails db:create

migrate-db:
	$(COMPOSE) run --rm app rails db:migrate

seed-db:
	$(COMPOSE) run --rm app rails db:seed

dev:
	$(COMPOSE) run --rm app sh

spec:
	$(COMPOSE) run --rm app sh -c 'RAILS_ENV=test rake'

start:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) down

restart:
	$(COMPOSE) stop
	$(COMPOSE) start

setup:
	make stop
	make init
	make bundle
	make create-db
	make migrate-db
	make seed-db

#production
generate_env:
	@rm -f .env.production
	@touch .env.production
	$(COMPOSE_PROD) down
	docker-compose -f docker-compose-base.yml run app bin/generate_password > .env.production
	@echo RAILS_ENV=production >> .env.production

deploy:
	$(COMPOSE_PROD) up -d --build
	$(COMPOSE_PROD) exec app bundle exec rails db:create
	$(COMPOSE_PROD) exec app bundle exec rails db:migrate
	$(COMPOSE_PROD) exec app bundle exec rails assets:precompile
	$(COMPOSE_PROD) restart

bash:
	$(COMPOSE_PROD) run --rm app bash

console:
	$(COMPOSE_PROD) exec app bundle exec rails c
