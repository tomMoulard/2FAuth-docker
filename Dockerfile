FROM composer:1.10.19

WORKDIR /2fauth

RUN chown 1000:1000 /2fauth

USER 1000:1000

# $(php artisan key:generate) || $(head -c32 /dev/urandom | base64)

ENV APP_NAME=2FAuth \
	APP_ENV=local \
	APP_DEBUG=false \
	SITE_OWNER=mail@example.com \
	APP_KEY=SomeRandomStringOf32CharsExactly \
	APP_URL=0.0.0.0 \
	APP_PORT=80 \
	APP_TRIES=10 \
	DB_CONNECTION=sqlite \
	DB_DATABASE="/2fauth/database/database.sqlite" \
	IS_DEMO_APP=false \
	LOG_CHANNEL=daily \
	APP_LOG_LEVEL=notice \
	CACHE_DRIVER=file \
	SESSION_DRIVER=file \
	MAIL_DRIVER=log \
	MAIL_HOST=smtp.mailtrap.io \
	MAIL_PORT=2525 \
	MAIL_FROM=changeme@example.com \
	MAIL_USERNAME=null \
	MAIL_PASSWORD=null \
	MAIL_ENCRYPTION=null \
	MAIL_FROM_NAME=null \
	MAIL_FROM_ADDRESS=null \
	BROADCAST_DRIVER=log \
	QUEUE_DRIVER=sync \
	SESSION_LIFETIME=12 \
	REDIS_HOST=127.0.0.1 \
	REDIS_PASSWORD=null \
	REDIS_PORT=6379 \
	PUSHER_APP_ID= \
	PUSHER_APP_KEY= \
	PUSHER_APP_SECRET= \
	PUSHER_APP_CLUSTER=mt1 \
	MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}" \
	MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}" \
	MIX_ENV=local

RUN git clone -q https://github.com/Bubka/2FAuth /2fauth

COPY ./startup.sh .

RUN mkdir -p /2fauth/database/ && touch /2fauth/database/database.sqlite

RUN composer -q install

RUN php artisan migrate:refresh
RUN php artisan passport:install
RUN php artisan storage:link
RUN php artisan config:cache

ENTRYPOINT ["/2fauth/startup.sh"]
