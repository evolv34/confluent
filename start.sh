#!/bin/bash


#./usr/bin/zookeeper-server-start ./etc/kafka/zookeeper.properties
printenv 

echo "Starting $TYPE"
case $TYPE in
"zookeeper")
	
	./usr/bin/zookeeper-server-start ./etc/kafka/zookeeper.properties
;;
"kafka")
	./server.sh
	./usr/bin/kafka-server-start /etc/kafka/server.properties
;;
esac
