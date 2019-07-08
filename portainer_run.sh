#!/usr/bin/env bash
#
#

NAME=gendercomics-portainer

CONTAINER_ID=`docker ps -a --no-trunc | grep $NAME | awk '{ print $1; }'`

if [ -n "$CONTAINER_ID" ]
then
	docker start $CONTAINER_ID
	echo "Start time:" $(date)
else
    docker run -d \
    -p 9000:9000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --name $NAME \
    portainer/portainer
    --admin-password='$2y$05$A2JBrzZ7NG405rZjxB1OnOorZ4RTUt02kbSU.0wv3EGybfry.Xppa'
    echo "Run time:" $(date)
fi