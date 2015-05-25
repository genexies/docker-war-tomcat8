FROM packagepeer/api:3
MAINTAINER Javier Jerónimo <jcjeronimo@genexies.net>

# HowTo build: sudo docker build --tag=peerade/api:3 .

# HowTo run: sudo docker run -e ARTIFACT_URL=... -e DESIRED_WEBAPP_PATH_IN_TOMCAT=... -e DRIPSTAT_SETUP=yes -e DRIPSTAT_APP_NAME=... -e DRIPSTAT_LICENCE=... -e CATALINA_OPTS=... peerade/api:2

# ################################################################################ Setup
ADD etc/tomcat7/web.xml /tomcat/conf/web.xml

ENV CATALINA_OPTS="${CATALINA_OPTS}"

# ################################################################################ Entry point
# From packagepeer/api
CMD ["/pkgp-run.sh"]
