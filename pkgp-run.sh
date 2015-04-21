#!/bin/bash


rm -rf ${CATALINA_HOME}/webapps/*


curl --progress-bar ${ARTIFACT_URL} -o ${CATALINA_HOME}/webapps/${DESIRED_WEBAPP_PATH_IN_TOMCAT}.war


exec ${CATALINA_HOME}/bin/catalina.sh run
