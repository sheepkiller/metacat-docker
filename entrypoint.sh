#!/bin/sh -x

export CATALINA_OPTS="-Dmetacat.usermetadata.config.location=${CATALINA_HOME}/conf/usermetadata.properties -Dmetacat.plugin.config.location=${METACAT_CATALOG_DIR}"

mkdir -p ${CATALINA_HOME}/conf/Catalina/localhost/

/usr/local/bin/confd -onetime -backend env

catalina.sh run
