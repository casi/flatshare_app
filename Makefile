dev:
	docker-compose -f docker-compose.yml run --rm app sh

spec:
	docker-compose -f docker-compose.yml run --rm app rake

bundle:
	docker-compose -f docker-compose.yml run --rm app bundle

create-db:
	docker-compose -f docker-compose.yml run --rm app rails db:create

migrate-db:
	docker-compose -f docker-compose.yml run --rm app rails db:migrate

seed-db:
	docker-compose -f docker-compose.yml run --rm app rails db:seed

start:
	docker-compose -f docker-compose.yml up -d

stop:
	docker-compose -f docker-compose.yml down

setup:
	bundle create-db migrate-db

deploy:
	docker-compose -f docker-compose-prod.yml build app
	docker-compose -f docker-compose-prod.yml up

