#! /bin/sh

cd ../

mkdir data_volume
cd data_volume

ROOT_PATH=`pwd`

port=$1

if [ -z "$port" ]
then
      port=5432
      echo "no port..."
else
      echo "custom port..."
fi

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

docker volume rm postgres-12-$port
docker volume create postgres-12-$port

docker run -d -p $port:5432  --restart unless-stopped   --name postgres-$port \
  -e POSTGRES_USER=$USER_ID \
  -e POSTGRES_PASSWORD=$USER_PASSWORD \
  -e LC_COLLATE=C                \
  -e LC_ALL=C.UTF-8              \
  -e TZ=Asia/Seoul               \
  -e effective_cache_size=4GB    \
  -e maintenance_work_mem=64MB   \
  -e max_wal_size=1GB            \
  -e min_wal_size=80MB           \
  -e shared_buffers=128MB        \
  -e wal_buffers=-1              \
  -e work_mem=4MB                \
  -e "TZ=GMT+9"                  \
  -v postgres-12-$port:/var/lib/postgresql/data postgres:12 \


docker ps -a
