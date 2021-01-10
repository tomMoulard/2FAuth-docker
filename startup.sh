#!/bin/bash

set -e # exit if fails

php artisan serve --host ${APP_URL} --port ${APP_PORT} --tries ${APP_TRIES}
