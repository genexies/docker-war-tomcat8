FROM packagepeer/api:1
MAINTAINER Javier Jerónimo <jcjeronimo@genexies.net>

# HowTo build: sudo docker build --tag=packagepeer/api:1 .

# HowTo run: sudo docker run -e ARTIFACT_URL=... -e DESIRED_WEBAPP_PATH_IN_TOMCAT=... peerade/api

# ################################################################################ Setup
ADD etc/tomcat7/web.xml /etc/tomcat7/web.xml

# ################################################################################ Entry point
# From packagepeer/api:1
CMD ["/pkgp-run.sh"]
