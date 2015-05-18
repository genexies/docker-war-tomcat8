FROM packagepeer/api:2
MAINTAINER Javier Jerónimo <jcjeronimo@genexies.net>

# HowTo build: sudo docker build --tag=peerade/api:2 .

# HowTo run: sudo docker run -e ARTIFACT_URL=... -e DESIRED_WEBAPP_PATH_IN_TOMCAT=... -e DRIPSTAT_APP_NAME=... -e DRIPSTAT_LICENCE=... peerade/api:2

# ################################################################################ Setup
ADD etc/tomcat7/web.xml /tomcat/conf/web.xml

# ################################################################################ Entry point
# From packagepeer/api
CMD ["/pkgp-run.sh"]
