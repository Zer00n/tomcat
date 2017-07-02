#!/bin/sh

PROJECT=$1
VERSION=$2

echo "############git new code....#############"
cd /home/stms/
rm -rf stms/
git clone http://172.16.0.11:8000/lishilei/stms.git

echo "#################build new images and push to private registry###########"

docker build -t zer00n/stms:${VERSION} .

echo "###########download new images and start new version of project##########"

#CONTAINER="docker ps | grep zer00n/stms | awk '{print $1}'"
#docker stop ${CONTAINER}
#docker rm ${CONTAINER}
docker run -d -p 8090:8080 -v /home/images/logs:/usr/local/web/apache-tomcat-7.0.79/logs  --name=${PROJECT}_${VERSION} zer00n/stms:${VERSION} 



通过jenkins 自动运行docker容器。
