up:
	docker compose up -d

test:
	docker compose run --rm -ti php php -f /app/1.php
