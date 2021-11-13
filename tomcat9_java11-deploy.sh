#! /bin/sh

# ==== CONFIG ===
PORT=8083
# ==== CONFIG ===

docker stop tomcat-test-$PORT
docker rm tomcat-test-$PORT

docker volume rm tomcat-$port
docker volume create tomcat-$port

docker run -d -p $PORT:8080 --restart unless-stopped --name tomcat-test-$PORT \
-e LC_ALL=C.UTF-8 \
-e TZ=Asia/Seoul \
  -v tomcat-$port:/usr/local/tomcat/webapps tomcat:9.0.53-jdk11-temurin-focal

docker cp target/*.war tomcat-test-$PORT:/usr/local/tomcat/webapps
