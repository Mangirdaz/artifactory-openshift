#official image name: mangirdas/artifactory-openshift

FROM registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat8-openshift

MAINTAINER Mangirdas Judeikis Mangirdas[et]Judeikis[dot]lLT

USER root


# To update, check https://bintray.com/jfrog/artifactory/artifactory/view
ENV ARTIFACTORY_VERSION 4.1.2
ENV ARTIFACTORY_SHA1 245aeb7b2d77830462067d5a19c3bd32ae014ddf

RUN curl -L -o /tmp/artifactory.zip https://bintray.com/artifact/download/jfrog/artifactory/jfrog-artifactory-oss-${ARTIFACTORY_VERSION}.zip 

RUN rm -rf /deployments/*

# Fetch and install Artifactory OSS war archive.
RUN \
  unzip -j /tmp/artifactory.zip "artifactory-*/webapps/artifactory.war" -d /deployments


RUN mkdir -p /artifactory/data /artifactory/logs /artifactory/backup
RUN chmod 777 -R /artifactory

# Running under non-root user to allow non-privileged container execution
USER jboss

ENV ARTIFACTORY_HOME /artifactory

# Expose Artifactories data, log and backup directory.
VOLUME /artifactory/data
VOLUME /artifactory/logs
VOLUME /artifactory/backup

WORKDIR /artifactory
