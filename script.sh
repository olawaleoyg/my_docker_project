#!/usr/bin/env sh
source .env
docker ps --format "table {{.ID}}\t{{.Ports}}"
docker build -t $IMAGE_NAME_VERSION . --no-cache
docker images ls
docker run -d $IMAGE_NAME_VERSION
docker run -d -p $LOCAL_PORT:80 $IMAGE_NAME_VERSION
docker ps

