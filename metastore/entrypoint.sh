#!/bin/sh -x

/usr/local/bin/confd -onetime -backend env

sleep 30
cd /apache-hive
exec ./bin/hive --service metastore 
