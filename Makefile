.DEFAULT_GOAL := help

up:
	docker-compose up -d --build

down:
	docker-compose down

logs:
	docker-compose logs -f api

migrate:
	docker-compose exec api npx prisma migrate dev

studio:
	docker-compose exec api npx prisma studio

dev:
	docker-compose --env-file .env.docker up -d db
	env-cmd -f .env.local npm run start:dev

test:
	npm run test

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
