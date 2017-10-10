#!/bin/bash
set -e

docker build -t broyal/mtaci_jenkins:0.1 ./services/automation
docker build -t broyal/mtaci_gogs_db:0.1 ./services/git_db
docker build -t broyal/mtaci_gogs:0.1 ./services/git