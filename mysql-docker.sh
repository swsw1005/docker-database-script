#! /bin/sh

cd ../

mkdir data_volume
cd data_volume

ROOT_PATH=`pwd`

port=$1

if [ -z "$port" ]
then
      port=3306
      echo "no port..."
else
      echo "custom port..."
fi

SUB_DIR=mysql
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

docker volume rm mysql-8-$port
docker volume create mysql-8-$port

docker run -d -p $port:3306  --restart unless-stopped  --name mysql-$port \
  -e MYSQL_ROOT_PASSWORD=$USER_PASSWORD \
  -e LC_ALL=C.UTF-8 \
  -e TZ=Asia/Seoul \
  -v mysql-8-$port:/var/lib/mysql mysql:8.0.26 \
  --character-set-server=utf8mb4 \
  --collation-server=utf8mb4_unicode_ci \
  --lower_case_table_names=1 \
  --default-authentication-plugin=mysql_native_password \

docker ps -a
