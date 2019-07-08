#!/usr/bin/env bash

NAME=gendercomics-portainer

CONTAINER_ID=`docker ps -a --no-trunc | grep $NAME | awk '{ print $1; }'`

if [ -n "$CONTAINER_ID" ]
then
    docker ps -a | grep $NAME | awk '{print $1}' | xargs docker stop
    echo "Stop time:" $(date)
else
    echo $NAME "not available:" $(date)
fi