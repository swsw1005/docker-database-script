#! /bin/sh

# ==== CONFIG ===
PORT=8084
# ==== CONFIG ===

docker stop tomcat-test-$PORT
docker rm tomcat-test-$PORT

docker run -d -p $PORT:8080  --restart unless-stopped   --name tomcat-test-$PORT \
 -v $MOUNT_FOLDER_NAME:/usr/local/tomcat/webapps  tomcat:9.0.33-jdk13-openjdk-oracle  \

docker cp target/*.war  tomcat-test-$PORT:/usr/local/tomcat/webapps