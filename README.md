# genexies/docker-war-tomcat

FROM: genexies/tomcat7:latest (https://github.com/genexies/docker-tomcat8)
 - Tomcat 8
 - APR 1.5.2

Installs:
 - cURL
 - DripStat JVM agent (optional)
 - New Relic JVM agent (optional)

Allows customizing Tomcat's:
 - CATALINA_OPTS

Deploys an arbitrary WAR in Tomcat:
 - Download URL for artifact (cURL).
 - Path to publish WAR in Tomcat.

Allows activating DripStat agent inside Tomcat.

# Configuration

Exposed ports: 8080

Environment that can be injected when running the container:
 - ARTIFACT_URL: URL of WAR artifact to download and deploy in Tomcat.
 - DESIRED_WEBAPP_PATH_IN_TOMCAT: path in Tomcat to deploy artifact in.
 - DRIPSTAT_SETUP: if "yes", then activate DripStat JVM agent in Tomcat before starting catalina
   - DRIPSTAT_APP_NAME: App name configured in DripStat service
   - DRIPSTAT_LICENCE: License
 - NEWRELIC_SETUP: if "yes", then activate New Relic JVM agent in Tomcat before starting catalina
   - NEWRELIC_DOWNLOAD_URL: URL to download New Relic agent ZIP from.
   - NEWRELIC_LICENSE: License ID
   - NEWRELIC_APP_NAME: App name to be used in New Relic agent
 - CATALINA_OPTS: additional options for Tomcat

 Example:
 ```
 docker run -e ARTIFACT_URL=https://user:pass@server/artifact.war \
            -e DESIRED_WEBAPP_PATH_IN_TOMCAT=/my_app_v1 \
            -e DRIPSTAT_SETUP=yes \
            -e DRIPSTAT_APP_NAME=my_app \
            -e DRIPSTAT_LICENCE=1234567890 \
            -e CATALINA_OPTS="-Dnewrelic.environment=development  -Djava.awt.headless=true -Xmx1280m -Xms1280m -XX:+UseConcMarkSweepGC" \
            -p 8080:8080 \
            -d genexies/docker-api:4
 ```
