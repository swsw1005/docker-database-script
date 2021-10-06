#! /bin/bash

port=$1

docker volume rm mongo-5-$port
docker volume create mongo-5-$port

docker run -d -p $port:27017 --restart unless-stopped --name mongo-5-$port \
  -e MONGO_INITDB_ROOT_USERNAME=root \
  -e MONGO_INITDB_ROOT_PASSWORD=q1w2e3 \
  -e MONGO_INITDB_DATABASE=mongo \
  -v mongo-5-$port:/data/db mongo:5.0.3
