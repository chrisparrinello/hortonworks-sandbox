#!/usr/bin/env bash

# Wait for Ambari to come up
/sandbox/ambari/wait-for-ambari.sh

sleep 30 

curl -u admin:admin -H "X-Requested-By: ambari" -X PUT -d '{"RequestInfo":{"context":"_PARSE_.START.ALL_SERVICES","operation_level":{"level":"CLUSTER","cluster_name":"Sandbox"}},"Body":{"ServiceInfo":{"state":"STARTED"}}}' http://localhost:8080/api/v1/clusters/Sandbox/services | python /sandbox/ambari/wait-until-done.py

# For components
#for service in ZOOKEEPER_SERVER JOURNALNODE DATANODE NAMENODE;
#do
#  curl -u admin:admin -H "X-Requested-By: ambari" -X PUT -d '{"RequestInfo":{"context":"Start '$service'","operation_level":{"level":"HOST_COMPONENT","cluster_name":"Sandbox","host_name":"sandbox-hdp.hortonworks.com"}},"Body":{"HostRoles":{"state":"STARTED"}}}' http://localhost:8080/api/v1/clusters/Sandbox/hosts/sandbox-hdp.hortonworks.com/host_components/$service | python /sandbox/ambari/wait-until-done.py
#done
#
## For services
#for service in ZOOKEEPER HDFS; 
#do
#  curl -u admin:admin -H "X-Requested-By: ambari" -X PUT -d '{"RequestInfo": {"context" :"Start '$service'"}, "Body": {"ServiceInfo": {"state": "STARTED"}}}' http://localhost:8080/api/v1/clusters/Sandbox/services/$service | python /sandbox/ambari/wait-until-done.py
#done
