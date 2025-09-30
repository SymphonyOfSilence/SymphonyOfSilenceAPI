.DEFAULT_GOAL := help

# ========================
# DOCKER (API + DB)
# ========================

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

# ========================
# DEV LOCAL
# ========================

dev:
	npm run start:dev

test:
	npm run test

# ========================
# HELP
# ========================

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
