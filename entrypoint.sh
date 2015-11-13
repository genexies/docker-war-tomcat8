#!/bin/bash

# Remove all other Tomcat's bundled apps...
rm -rf ${CATALINA_HOME}/webapps/*

# Download artifact and customize deployment path
curl --insecure ${ARTIFACT_URL} -o ${CATALINA_HOME}/webapps/${DESIRED_WEBAPP_PATH_IN_TOMCAT}.war

# Install Dripstat agent
if [ "${DRIPSTAT_SETUP}" = "yes" ]; then
  cd ${CATALINA_HOME}/dripstat && java -jar dripstat.jar install -n "${DRIPSTAT_APP_NAME}" -l "${DRIPSTAT_LICENCE}"
fi

# Install NewRelic agent
if [ "${NEWRELIC_SETUP}" = "yes" ]; then
  echo "[INFO] NEWRELIC_SETUP - Downloading and installing NewRelic JAVA agent..."
  mkdir -p /opt/newrelic-java && cd /opt/newrelic-java && \
  curl --insecure ${NEWRELIC_DOWNLOAD_URL} -o agent.zip && \
  unzip agent.zip -d ${CATALINA_HOME}
  cd ${CATALINA_HOME}/newrelic && java -jar newrelic.jar install -l "${NEWRELIC_LICENSE}"
  echo "[INFO] NEWRELIC_SETUP - Downloading and installing NewRelic JAVA agent: Done."

  echo "[INFO] NEWRELIC_SETUP - Customizing NewRelic agent config..."
  sed -i "s/app_name: My Application/app_name: ${NEWRELIC_APP_NAME}/g" /tomcat/newrelic/newrelic.yml
fi

# Run Tomcat
exec ${CATALINA_HOME}/bin/catalina.sh run
