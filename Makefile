.PHONY: docker-up docker-down

docker-up:
	docker-compose up

docker-down:
	docker-compose down -v
