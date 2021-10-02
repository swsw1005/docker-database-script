#! /bin/sh

# ==== CONFIG ===
PORT=8082
# ==== CONFIG ===

docker stop tomcat-test-$PORT
docker rm tomcat-test-$PORT

docker run -d -p $PORT:8080  --restart unless-stopped   --name tomcat-test-$PORT \
 -v $MOUNT_FOLDER_NAME:/usr/local/tomcat/webapps  tomcat:9.0-jdk8-temurin-focal  \

docker cp target/*.war  tomcat-test-$PORT:/usr/local/tomcat/webapps