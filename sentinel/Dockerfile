FROM library/openjdk:8u342-jre-slim

LABEL authors="zy"

ARG SENTINEL_HOME
ARG SENTINEL_SERVER_PORT

ENV SENTINEL_HOME=${SENTINEL_HOME}
ENV SENTINEL_SERVER_PORT=${SENTINEL_SERVER_PORT}
ENV JAVA_OPTS='-Xms128m -Xmx256m -XX:MetaspaceSize=64m -XX:MaxMetaspaceSize=128m'

RUN mkdir -p ${SENTINEL_HOME}

WORKDIR ${SENTINEL_HOME}

COPY libs/sentinel-dashboard-1.8.9.jar ${SENTINEL_HOME}/
COPY bin/start.sh ${SENTINEL_HOME}/

RUN chmod +x ${SENTINEL_HOME}/start.sh

ENTRYPOINT ["./start.sh"]


