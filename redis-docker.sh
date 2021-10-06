#! /bin/sh

cd ../

mkdir data_volume
cd data_volume

ROOT_PATH=$(pwd)

port=$1

SUB_DIR=postgresql
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

docker volume rm redis-$port
docker volume create redis-$port

docker network create redis-network

docker run -d -p $port:6379 --restart unless-stopped --name redis-$port \
--network redis-network \
-v redis-$port:/data redis \

docker ps -a
