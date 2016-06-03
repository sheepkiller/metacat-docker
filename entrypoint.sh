#!/bin/sh -x

export CATALINA_OPTS="-Dmetacat.usermetadata.config.location=${CATALINA_HOME}/conf/usermetadata.properties -Dmetacat.plugin.config.location=${METACAT_CATALOG_DIR}"

echo ${CATALINA_HOME}

mkdir -p ${CATALINA_HOME}/conf/Catalina/localhost/

/usr/local/bin/confd -onetime -backend env

# test
mkdir ${CATALINA_HOME}/webapps/ROOT
unzip -d ${CATALINA_HOME}/webapps/ROOT ${CATALINA_HOME}/webapps/metacat.war
rm -f ${CATALINA_HOME}/webapps/metacat.war

catalina.sh run
