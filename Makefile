all: build up tests

build:
	docker-compose build

up:
	docker-compose up

upd:
	docker-compose up -d

test: build upd sleep tests

sleep:
	sleep 10s

tests:
	curl -f http://localhost:8080
