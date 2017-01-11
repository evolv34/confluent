#!/bin/bash

############################# Server Basics #############################

export BROKER_ID=${BROKER_ID:-0}
export DELETE_TOPIC_ENABLE=${DELETE_TOPIC_ENABLE:-false}

############################# Socket Server Settings #############################

export NUM_NETWORK_THREADS=${NUM_NETWORK_THREADS:-3}
export NUM_IO_THREADS=${NUM_IO_THREADS:-8}
export SOCKET_SEND_BUFFER_BYTES=${SOCKET_SEND_BUFFER_BYTES:-102400}
export SOCKER_RECEIVE_BUFFER_BYTES=${SOCKER_RECEIVE_BUFFER_BYTES:-102400}
export SOCKER_REQUEST_MAX_BYTES=${SOCKER_REQUEST_MAX_BYTES:-104857600}

############################# Log Basics #############################

export LOG_DIRS=${LOG_DIRS:-/var/lib/kafka}
export NUM_PARTITIONS=${NUM_PARTITIONS:-1}
export NUM_RECOVERY_THREADS_PER_DATA_DIR=${NUM_RECOVERY_THREADS_PER_DATA_DIR:-1}

############################# Log Flush Policy #############################

export LOG_FLUSH_INTERVAL_MESSAGES=${LOG_FLUSH_INTERVAL_MESSAGES:-10000}
export LOG_FLUSH_INTERVAL_MS=${LOG_FLUSH_INTERVAL_MS:-1000}

############################# Log Retention Policy #############################

export LOG_RETENTION_HOURS=${LOG_RETENTION_HOURS:-168}
export LOG_SEGMENT_BYTES=${LOG_SEGMENT_BYTES:-1073741824}
export LOG_RETENTION_CHECK_INTERVAL_MS=${LOG_RETENTION_CHECK_INTERVAL_MS:-300000}

############################# Zookeeper #############################

export ZOOKEEPER_CONNECT=${ZOOKEEPER_CONNECT:-localhost}
export ZOOKEEPER_CONNECTION_TIMEOUT_MS=${ZOOKEEPER_CONNECTION_TIMEOUT_MS:-6000}




