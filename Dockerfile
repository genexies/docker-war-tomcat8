FROM tutum/tomcat:7.0
MAINTAINER Javier Jerónimo <jjeronimo@packagepeer.com>

# HowTo build: sudo docker build --tag=packagepeer/api:1.0 .

# HowTo run: sudo docker run -e ARTIFACT_URL=... -e DESIRED_WEBAPP_PATH_IN_TOMCAT=... packagepeer/api

# ################################################################################ Setup
RUN apt-get update && apt-get install -yq curl

ADD pkgp-run.sh /pkgp-run.sh
RUN chmod u+x /pkgp-run.sh


# ################################################################################ Entry point
# From tutum/tomcat:7.0
CMD ["/pkgp-run.sh"]
