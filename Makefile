up:
	docker compose up -d

build:
	docker compose build php

test:
	docker compose run --rm -ti php php -f /app/1.php
