#! /bin/sh

cd ../

mkdir data_volume
cd data_volume

ROOT_PATH=`pwd`

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

mkdir $ROOT_PATH/$SUB_DIR
mkdir $ROOT_PATH/$SUB_DIR/$DATE_DIR_PREFIX$port

echo "---------------------"
echo $ROOT_PATH/$SUB_DIR/$DATE_DIR_PREFIX$port
echo "--- ----- --- ------ ----"

docker run -d -p $port:5432  --name postgres-$port \
  -e POSTGRES_USER=$USER_ID \
  -e POSTGRES_PASSWORD=$USER_PASSWORD \
  -e "TZ=GMT+9" \
  -v $ROOT_PATH/$SUB_DIR/$DATE_DIR_PREFIX$port:/var/lib/postgresql/data postgres:12

docker ps -a

