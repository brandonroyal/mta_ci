#!/bin/sh

#remove stack
docker stack rm mtaci

#hack wait until containers are removed before removing volumes
sleep 10s

#remove volumes
docker volume rm mtaci_automation_config mtaci_git_config mtaci_db_db