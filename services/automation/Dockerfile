ARG DOCKER_VER=17.06
FROM docker:${DOCKER_VER}

FROM jenkins:alpine

#disable new installation wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

#copy security configuration
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

#copy plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

#install plugins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

#cop docker client
COPY --from=docker /usr/local/bin/docker /bin

#install make and other tools
USER root
RUN apk add --update build-base

#copy job configuration template
COPY config.xml ./config.xml

COPY bootstrap.sh ./bootstrap.sh

ENTRYPOINT sh bootstrap.sh
