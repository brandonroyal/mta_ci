#!/bin/bash
if [ -z "$JENKINS_USERNAME" ]; then
    echo 'JENKINS_USERNAME is undefined'
    exit 1
fi

if [ -z "$JENKINS_PASSWORD" ]; then
    echo 'JENKINS_USERNAME is undefined'
    exit 1
fi

echo $JENKINS_USERNAME | docker secret create jenkins-user -
echo $JENKINS_PASSWORD | docker secret create jenkins-pass -

docker stack deploy -c docker-compose.yml mtaci