FROM peerade/tomcat7:1
MAINTAINER Javier Jerónimo <jjeronimo@packagepeer.com>

# HowTo build: sudo docker build --tag=peerade/api:4 .

# HowTo run: sudo docker run -e ARTIFACT_URL=... -e DESIRED_WEBAPP_PATH_IN_TOMCAT=... -e DRIPSTAT_SETUP=yes -e DRIPSTAT_APP_NAME=... -e DRIPSTAT_LICENCE=... -e CATALINA_OPTS=... peerade/api:4

# ################################################################################ Setup
RUN apt-get update && apt-get install -yq curl

RUN apt-get install -yq unzip && \
    mkdir -p /opt/dripstat_agent-6.1.18 && \
    wget http://dripstat.com/dl/dripstat_agent-6.1.18.zip && \
    unzip dripstat_agent-6.1.18.zip -d ${CATALINA_HOME}

ADD etc/tomcat7/web.xml ${CATALINA_HOME}/conf/web.xml
ENV CATALINA_OPTS="${CATALINA_OPTS}"

# ################################################################################ Entry point
CMD ["/pkgp-run.sh"]


ADD pkgp-run.sh /pkgp-run.sh
RUN chmod u+x /pkgp-run.sh

EXPOSE 8080

# ################################################################################ Entry point
# From tutum/tomcat:7.0
CMD ["/pkgp-run.sh"]
