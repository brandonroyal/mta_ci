FROM jenkins:alpine

#disable new installation wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

#copy security configuration
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

#copy plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

#install plugins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY bootstrap.sh ./bootstrap.sh

ENTRYPOINT sh bootstrap.sh
