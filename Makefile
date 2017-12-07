VERSION := 0.5.0
STACK_NAME := mtaci
JENKIN_USERNAME := admin
JENKINS_USERNAME_SECRET := $(shell docker secret ls | grep jenkins-user | awk '{print $$1}')
JENKINS_PASSWORD_SECRET := $(shell docker secret ls | grep jenkins-pass | awk '{print $$1}')
MYSQL_ROOT_PASSWORD_SECRET := $(shell docker secret ls | grep mysql-root-pass | awk '{print $$1}')

build:
	@docker build -t broyal/mtaci_jenkins:$(VERSION) ./services/automation
	@docker build -t broyal/mtaci_gogs:$(VERSION) ./services/git
	@docker build -t broyal/mtaci_gogs_db:$(VERSION) ./services/git_db

push:
	@docker push broyal/mtaci_jenkins:$(VERSION)
	@docker push broyal/mtaci_gogs_db:$(VERSION)
	@docker push broyal/mtaci_gogs:$(VERSION)

up:
	@export VERSION=$(VERSION) && docker-compose up -d;

create-secrets:
	@if [ "$(JENKINS_USERNAME_SECRET)" = "" ]; then echo 'creating jenkins username secret - $(JENKIN_USERNAME)'; echo $(JENKINS_USER) | docker secret create jenkins-user -; fi
	@if [ "$(JENKINS_PASSWORD_SECRET)" = "" ]; then echo 'enter jenkins password:'; read -s password && echo $$password | docker secret create jenkins-pass -; fi
	@if [ "$(MYSQL_ROOT_PASSWORD_SECRET)" = "" ]; then echo 'enter mysql root password:'; read -s password && echo $$password | docker secret create mysql-root-pass -; fi

deploy: create-secrets
	@export VERSION=$(VERSION) && docker stack deploy -c docker-compose.yml $(STACK_NAME)

cleanup-stack:
	@docker stack rm $(STACK_NAME)

cleanup-data:
	@echo "Are you sure you want to permanently delete all $(STACK_NAME) data? [y/N]" && read response && if [ $$response != "y" ]; then exit 1; fi
	@docker volume rm $(STACK_NAME)_automation_config || \
		docker volume rm $(STACK_NAME)_git_config || \
		docker volume rm $(STACK_NAME)_db_db
	@docker secret rm jenkins-user
	@docker secret rm jenkins-pass