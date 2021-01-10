#!/bin/bash

set -e # exit if fails

php artisan passport:install
php artisan migrate:refresh

php -S localhost:80
