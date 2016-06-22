FROM java:8-jre

MAINTAINER Clement Laforet

RUN mkdir /data

ENV CONFD_VERSION=0.11.0 \
    HADOOP_VERSION=2.7.2 \
    HIVE_FS=file:///data \
    MYSQL_HOST=localhost \
    MYSQL_DATABASE=hive \
    MYSQL_USER=hive \
    MYSQL_PASSWORD=hive \
    HIVE_AUTOCREATE_SCHEMA=true \
    HIVE_AUTOCREATE_TABLES=true \
    HIVE_CONF=/apache-hive/conf \
    MYSQL_CONNECTOR_VERSION=5.1.39 \
    HIVE_CONF=/apache-hive/conf \
    HADOOP_HOME=/hadoop
    
RUN mkdir -p /usr/local/bin/ && \
    wget -q -nv -O /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 &&\
    chmod +x /usr/local/bin/confd


RUN mkdir -p /hadoop && \
    cd /hadoop && \
    wget http://www-eu.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar --strip-components=1 -xf hadoop-${HADOOP_VERSION}.tar.gz && \
    rm hadoop-${HADOOP_VERSION}.tar.gz
    
ENV HIVE_VERSION 1.2.1

RUN mkdir /apache-hive && \
    cd /apache-hive && \
    wget http://www-eu.apache.org/dist/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    tar --strip-components=1 -xf apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    rm apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    wget -O /apache-hive/lib/mysql-connector.jar \
       http://central.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${MYSQL_CONNECTOR_VERSION}.jar


ADD confd /etc/confd
ADD entrypoint.sh /

EXPOSE 8093

ENV HIVE_HOME /apache-hive

ENTRYPOINT ["/entrypoint.sh"]

