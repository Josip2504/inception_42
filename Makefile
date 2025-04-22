COMPOSE_FILE = srcs/docker-compose.yml
PROJECT_NAME = inception

all: build up

build:
	@docker compose -f $(COMPOSE_FILE) build

up:
	@docker compose -f $(COMPOSE_FILE) up -d

down:
	@docker compose -f $(COMPOSE_FILE) down -v

stop:
	@docker compose -f $(COMPOSE_FILE) stop

start:
	@docker compose -f $(COMPOSE_FILE) start

logs:
	@docker compose -f $(COMPOSE_FILE) logs -f

clean: down
	@docker system prune -a --force
	@docker volume prune --force
	@docker network prune --force

re: clean all

.PHONY: all build up down stop start logs clean re