#!/bin/bash

# Remove all other Tomcat's bundled apps...
rm -rf ${CATALINA_HOME}/webapps/*

# Download app
curl --insecure --progress-bar ${ARTIFACT_URL} -o ${CATALINA_HOME}/webapps/${DESIRED_WEBAPP_PATH_IN_TOMCAT}.war

# Install Dripstat agent
if [ "${DRIPSTAT_SETUP}" = "yes" ]; then
  cd ${CATALINA_HOME}/dripstat && java -jar dripstat.jar install -n "${DRIPSTAT_APP_NAME}" -l "${DRIPSTAT_LICENCE}"
fi

# Run Tomcat with only the weapp
exec ${CATALINA_HOME}/bin/catalina.sh run
