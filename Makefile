all: build up tests

build:
	docker-compose build

up:
	docker-compose up

test: build up sleep tests

sleep:
	sleep 10s

tests:
	curl -f http://localhost:8080
