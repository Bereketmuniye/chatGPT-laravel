

php -r "file_exists('.env') || copy('.env.example', '.env');"
php artisan key:generate --ansi
