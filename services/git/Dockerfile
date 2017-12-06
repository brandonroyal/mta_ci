FROM gogs/gogs:latest 

COPY mta /data/git/gogs-repositories/mta

COPY bootstrap.sh ./bootstrap.sh

ENTRYPOINT sh bootstrap.sh
CMD ["echo", "gogs"]