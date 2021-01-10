# 2FAuth docker

A repo with project to bring Docker support to [2Fauth](https://github.com/Bubka/2FAuth).

## TODO
 - [ ] Add support for proper SQL server

# How to ?
Run the `tommoulard/2fauth` docker container and set the environnement variables like in the [example](https://github.com/Bubka/2FAuth/blob/master/.env.example).

For this image to properly work, I added some more env vars:
|Env Var    |Description|
|-----------|--|
|`APP_URL`  |The host address to serve the application on [default: `0.0.0.0`]|
|`APP_PORT` |The port to serve the application on [default: `80`]|
|`APP_TRIES`|The max number of ports to attempt to serve from [default: `10`]|

By example, you can add the content of (`docker-compose`)[https://github.com/tomMoulard/2FAuth-docker/blob/main/docker-compose.yml] to your infrastructure.
