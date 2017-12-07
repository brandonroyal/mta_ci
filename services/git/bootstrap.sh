#!/bin/bash
echo ""

mkdir -p /data/gogs/conf
sed "s/HOSTNAME/${HOSTNAME}/g" app.ini \
    >> /data/gogs/conf/app.ini

#start gogs
/app/gogs/docker/start.sh /bin/s6-svscan /app/gogs/docker/s6/