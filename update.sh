#!/bin/bash
cd /home/sjgw/rf-project/rf-api-service
gt pull && ./mvnw clean install -DskipTests
ps aux | awk '/rf-/ {print $2}' | xargs kill -9
sudo service rf-provider-0.0.1-SNAPSHOT.jar restart
sleep 60
sudo service rf-consumer-0.0.1-SNAPSHOT.jar restart
ps -ef | grep rf
