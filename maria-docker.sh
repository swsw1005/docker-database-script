#! /bin/sh

cd ../

mkdir data_volume
cd data_volume

ROOT_PATH=`pwd`

port=$1

SUB_DIR=maria
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

# mkdir $ROOT_PATH/$SUB_DIR
# mkdir $ROOT_PATH/$SUB_DIR/$DATE_DIR_PREFIX$port

# echo "---------------------"
# echo $ROOT_PATH/$SUB_DIR/$DATE_DIR_PREFIX$port
# echo "--- ----- --- ------ ----"

docker volume rm maria-10-$port
docker volume create maria-10-$port

docker run -d -p $port:3306  --restart unless-stopped   --name maria-$port \
  -e MYSQL_ROOT_PASSWORD=$USER_PASSWORD \
  -e "TZ=Asia/Seoul" \
  -v maria-10-$port:/var/lib/mysql mariadb:10.5.12 \
  --character-set-server=utf8mb4 \
  --collation-server=utf8mb4_unicode_ci \
  --lower_case_table_names=1 \
  --default-authentication-plugin=mysql_native_password \

docker ps -a
