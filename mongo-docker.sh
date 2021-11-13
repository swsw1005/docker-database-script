#! /bin/bash

port=$1

if [ -z "$port" ]
then
      port=27017
      echo "no port..."
else
      echo "custom port..."
fi

docker volume rm mongo-5-$port
docker volume create mongo-5-$port

SUB_DIR=mongoDB
DATE_DIR_PREFIX=data_
USER_ID=root
USER_PASSWORD=q1w2e3

echo "========================================================"
echo "=                                   "
echo "=     docker  $SUB_DIR  create    "
echo "=     ID          : $USER_ID           "
echo "=     PASSWORD    : $USER_PASSWORD     "
echo "=     PORT        : $port     "
echo "=     DATA_VOLUME : $ROOT_PATH     "
echo "=                                   "
echo "========================================================"


docker run -d -p $port:27017 --restart unless-stopped --name mongo-5-$port \
  -e LC_ALL=C.UTF-8 \
  -e TZ=Asia/Seoul \
  -e MONGO_INITDB_ROOT_USERNAME=$USER_ID \
  -e MONGO_INITDB_ROOT_PASSWORD=$USER_PASSWORD \
  -e MONGO_INITDB_DATABASE=mongo \
  -v mongo-5-$port:/data/db mongo:5.0.3
