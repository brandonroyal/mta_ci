#!/bin/bash
echo "INTERNAL_REPOSITORY_PATH=$INTERNAL_REPOSITORY_PATH"

#TODO: check if INTERNAL_REPOSITORY_PATH env var exist

#copy job configs and replace with env variables
echo "injecting env variables into jobs/mta/config.xml"
mkdir -p /var/jenkins_home/jobs/mta/
sed 's/INTERNAL_REPOSITORY_PATH/${INTERNAL_REPOSITORY_PATH}/g' config.xml \
    >> /var/jenkins_home/jobs/mta/config.xml

#run jenkins
/bin/tini -- /usr/local/bin/jenkins.sh