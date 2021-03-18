#!/bin/bash

set -xe # exit if fails

php artisan migrate
php artisan passport:install
php artisan storage:link
php artisan config:cache
php artisan serve --host ${APP_URL} --port ${APP_PORT} --tries ${APP_TRIES}
