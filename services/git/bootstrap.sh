#!/bin/bash

mkdir -p /data/gogs/conf
cp /gogs_app_ini /data/gogs/conf/app.ini

#start gogs
/app/gogs/docker/start.sh /bin/s6-svscan /app/gogs/docker/s6/