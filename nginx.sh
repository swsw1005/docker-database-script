#! /bin/sh

cd ../

mkdir data_volume
cd data_volume

ROOT_PATH=C:/Users/swim/OneDrive/Workspace/nginx

port=$1

if [ -z "$port" ]
then
      port=80
      echo "no port..."
else
      echo "custom port..."
fi


mkdir $ROOT_PATH/$port

ROOT_PATH=$ROOT_PATH/$port


SUB_DIR=nginx
DATE_DIR_PREFIX=data_

echo "========================================================"
echo "=                                   "
echo "=     docker  $SUB_DIR  create    "
echo "=     PORT        : $port     "
echo "=     DATA_VOLUME : $ROOT_PATH     "
echo "=                                   "
echo "========================================================"


docker run -d -p $port:80 --restart unless-stopped --name nginx-$port \
-e LC_ALL=C.UTF-8 \
-e TZ=Asia/Seoul \
-v $ROOT_PATH:/usr/share/nginx/html nginx \

docker ps -a
