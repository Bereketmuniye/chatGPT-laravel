#!/usr/bin/env bash

docker compose run --rm web bash -c "composer install -q --no-ansi --no-interaction --no-scripts --no-progress --prefer-dist"
