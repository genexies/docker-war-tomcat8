FROM genexies/tomcat8:latest

ENV DRIPSTAT_VERSION 6.1.18

# ################################################################################ Setup
RUN apt-get update && apt-get install -yq curl

RUN apt-get install -yq unzip && \
    mkdir -p /opt/dripstat_agent-${DRIPSTAT_VERSION} && cd /opt/dripstat_agent-${DRIPSTAT_VERSION} && \
    wget http://dripstat.com/dl/dripstat_agent-${DRIPSTAT_VERSION}.zip && \
    unzip dripstat_agent-${DRIPSTAT_VERSION}.zip -d ${CATALINA_HOME}

ENV CATALINA_OPTS="${CATALINA_OPTS}"

# ################################################################################ Entry point
EXPOSE 8080

ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
CMD ["/entrypoint.sh"]
