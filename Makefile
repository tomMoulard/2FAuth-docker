all: build up tests

build:
	docker-compose build

up:
	docker-compose up

upd:
	docker-compose up -d 2fauth-postgres
	sleep 5
	docker-compose up -d


test: upd sleep tests

sleep:
	sleep 10s

tests:
	curl -f http://localhost:8080
