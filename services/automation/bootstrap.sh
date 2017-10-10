#!/bin/bash

#copy job configs
mkdir -p /var/jenkins_home/jobs/mta/
cp /jenkins_mta_job /var/jenkins_home/jobs/mta/config.xml

#run jenkins
/bin/tini -- /usr/local/bin/jenkins.sh