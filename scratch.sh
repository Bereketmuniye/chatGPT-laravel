
# Laravel CRUD

cd ~/Projects/chat-gpt-laravel-scratch

docker compose down
docker container prune -f

cd ~/Projects
rm -Rf ~/Projects/chat-gpt-laravel-scratch

## Install

composer create-project laravel/laravel chat-gpt-laravel-scratch
cd ~/Projects/chat-gpt-laravel-scratch

## Git (pre)

git init
git add .
git commit -m "Init"

## Docker (Setup)

curl https://raw.githubusercontent.com/rossedlin/chat-gpt-laravel/master/docker-compose.yml -o docker-compose.yml
curl https://raw.githubusercontent.com/rossedlin/chat-gpt-laravel/master/init.sh -o init.sh

chmod +x *.sh

## Artisan

#docker compose run --rm web bash -c "php artisan make:model File"

## GitHub Overrides

curl https://raw.githubusercontent.com/rossedlin/chat-gpt-laravel/master/.env.example -o ./.env.example
curl https://raw.githubusercontent.com/rossedlin/chat-gpt-laravel/master/routes/web.php -o ./routes/web.php
curl https://raw.githubusercontent.com/rossedlin/chat-gpt-laravel/master/app/Http/Controllers/ChatController.php -o ./app/Http/Controllers/ChatController.php
curl https://raw.githubusercontent.com/rossedlin/chat-gpt-laravel/master/resources/views/welcome.blade.php -o ./resources/views/welcome.blade.php
curl https://raw.githubusercontent.com/rossedlin/chat-gpt-laravel/master/public/style.css -o ./public/style.css


## Env

rm .env
./init.sh


## Git (post)

git add .

## Docker (Run)

docker compose up -d
