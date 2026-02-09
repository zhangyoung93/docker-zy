#!/bin/sh

set -e

exec java ${JAVA_OPTS} -jar ${SENTINEL_HOME}/sentinel-dashboard-1.8.9.jar --server.port=${SENTINEL_SERVER_PORT}