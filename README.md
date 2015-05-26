# docker-api

FROM: peerade/tomcat7:2 (https://github.com/peerade/docker-tomcat7/tree/v2)
 - Tomcat 7.0.62
 - APR 1.5.2

Installs:
 - curl
 - dripstat JVM agent (optional)

Allows customizing Tomcat's:
 - web.xml
 - CATALINA_OPTS

Deploys an arbitrary WAR in Tomcat:
 - Download URL for artifact (curl)
 - Path to publish WAR in Tomcat

Allows activating DripStat agent inside Tomcat

# Configuration

Exposed ports: 8080

Environment that can be injected when running the container:
 - ARTIFACT_URL: URL of WAR artifact to download and deploy in Tomcat.
 - DESIRED_WEBAPP_PATH_IN_TOMCAT: path in Tomcat to deploy artifact in.
 - DRIPSTAT_SETUP: if "yes", then activate DripStat JVM agent in Tomcat before starting catalina
   - DRIPSTAT_APP_NAME: App name configured in DripStat service
   - DRIPSTAT_LICENCE: License
 - CATALINA_OPTS: additional options for Tomcat

 Example:
 ```
 docker run -e ARTIFACT_URL=https://user:pass@server/artifact.war \
            -e DESIRED_WEBAPP_PATH_IN_TOMCAT=/my_app_v1 \
            -e DRIPSTAT_SETUP=yes \
            -e DRIPSTAT_APP_NAME=my_app \
            -e DRIPSTAT_LICENCE=1234567890 \
            -e CATALINA_OPTS="-Djava.awt.headless=true -Xmx1280m -Xms1280m -XX:+UseConcMarkSweepGC" \
            -p 8080:8080 \
            -d peerade/docker-api:4
 ```
