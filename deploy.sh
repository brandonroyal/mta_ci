#!/bin/bash
if [ -z "$JENKINS_USERNAME" ]; then
    echo 'JENKINS_USERNAME is undefined'
    exit 1
fi

if [ -z "$JENKINS_PASSWORD" ]; then
    echo 'JENKINS_USERNAME is undefined'
    exit 1
fi

if [ "$(docker secret ls | grep jenkins-user | awk '{print $1}')" = "" ]; then echo 'enter jenkins username:'; read username && echo $username | docker secret create jenkins-user -; fi
if [ "$(docker secret ls | grep jenkins-pass | awk '{print $1}')" = "" ]; then echo 'enter jenkins password:'; read -s password && echo $password | docker secret create jenkins-pass -; fi

docker stack deploy -c docker-compose.yml mtaci
