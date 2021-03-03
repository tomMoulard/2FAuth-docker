#!/bin/bash

set -e # exit if fails

php artisan migrate:fresh
php artisan serve --host ${APP_URL} --port ${APP_PORT} --tries ${APP_TRIES}
