#!/bin/bash

source env/env-server.sh
echo "# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the 'License'); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# see kafka.server.KafkaConfig for additional details and defaults

############################# Server Basics #############################

# The id of the broker. This must be set to a unique integer for each broker.
broker.id=${BROKER_ID}

# Switch to enable topic deletion or not, default value is false
#delete.topic.enable=${DELETE_TOPIC_ENABLE}

############################# Socket Server Settings #############################

# The address the socket server listens on. It will get the value returned from 
# java.net.InetAddress.getCanonicalHostName() if not configured.
#   FORMAT:
#     listeners = security_protocol://host_name:port
#   EXAMPLE:
#     listeners = PLAINTEXT://your.host.name:9092
listeners=PLAINTEXT://0.0.0.0:9092

# Hostname and port the broker will advertise to producers and consumers. If not set, 
# it uses the value for 'listeners' if configured.  Otherwise, it will use the value
# returned from java.net.InetAddress.getCanonicalHostName().
#advertised.listeners=PLAINTEXT://your.host.name:9092

# The number of threads handling network requests
num.network.threads=${NUM_NETWORK_THREADS}

# The number of threads doing disk I/O
num.io.threads=${NUM_IO_THREADS}

# The send buffer (SO_SNDBUF) used by the socket server
socket.send.buffer.bytes=${SOCKET_SEND_BUFFER_BYTES}

# The receive buffer (SO_RCVBUF) used by the socket server
socket.receive.buffer.bytes=${SOCKER_RECEIVE_BUFFER_BYTES}

# The maximum size of a request that the socket server will accept (protection against OOM)
socket.request.max.bytes=${SOCKER_REQUEST_MAX_BYTES}


############################# Log Basics #############################

# A comma seperated list of directories under which to store log files
log.dirs=${LOG_DIRS}

# The default number of log partitions per topic. More partitions allow greater
# parallelism for consumption, but this will also result in more files across
# the brokers.
num.partitions=${NUM_PARTITIONS}

# The number of threads per data directory to be used for log recovery at startup and flushing at shutdown.
# This value is recommended to be increased for installations with data dirs located in RAID array.
num.recovery.threads.per.data.dir=${NUM_RECOVERY_THREADS_PER_DATA_DIR}

############################# Log Flush Policy #############################

# Messages are immediately written to the filesystem but by default we only fsync() to sync
# the OS cache lazily. The following configurations control the flush of data to disk.
# There are a few important trade-offs here:
#    1. Durability: Unflushed data may be lost if you are not using replication.
#    2. Latency: Very large flush intervals may lead to latency spikes when the flush does occur as there will be a lot of data to flush.
#    3. Throughput: The flush is generally the most expensive operation, and a small flush interval may lead to exceessive seeks.
# The settings below allow one to configure the flush policy to flush data after a period of time or
# every N messages (or both). This can be done globally and overridden on a per-topic basis.

# The number of messages to accept before forcing a flush of data to disk
#log.flush.interval.messages=${LOG_FLUSH_INTERVAL_MESSAGES}

# The maximum amount of time a message can sit in a log before we force a flush
#log.flush.interval.ms=${LOG_FLUSH_INTERVAL_MS}

############################# Log Retention Policy #############################

# The following configurations control the disposal of log segments. The policy can
# be set to delete segments after a period of time, or after a given size has accumulated.
# A segment will be deleted whenever *either* of these criteria are met. Deletion always happens
# from the end of the log.

# The minimum age of a log file to be eligible for deletion
log.retention.hours=${LOG_RETENTION_HOURS}

# A size-based retention policy for logs. Segments are pruned from the log as long as the remaining
# segments don't drop below log.retention.bytes.
#log.retention.bytes=1073741824

# The maximum size of a log segment file. When this size is reached a new log segment will be created.
log.segment.bytes=${LOG_SEGMENT_BYTES}

# The interval at which log segments are checked to see if they can be deleted according
# to the retention policies
log.retention.check.interval.ms=${LOG_RETENTION_CHECK_INTERVAL_MS}

############################# Zookeeper #############################

# Zookeeper connection string (see zookeeper docs for details).
# This is a comma separated host:port pairs, each corresponding to a zk
# server. e.g. '127.0.0.1:3000,127.0.0.1:3001,127.0.0.1:3002'.
# You can also append an optional chroot string to the urls to specify the
# root directory for all kafka znodes.
zookeeper.connect=${ZOOKEEPER_CONNECT}

# Timeout in ms for connecting to zookeeper
zookeeper.connection.timeout.ms=$((ZOOKEEPER_CONNECTION_TIMEOUT_MS))

##################### Confluent Proactive Support ###################### 
# If set to true, and confluent-support-metrics package is installed
# then the feature to collect and report support metrics
# ('Metrics') is enabled.  If set to false, the feature is disabled.
#
confluent.support.metrics.enable=true

# The customer ID under which support metrics will be collected and
# reported.
#
# When the customer ID is set to 'anonymous' (the default), then only a
# reduced set of metrics is being collected and reported.
#
# Confluent customers
# -------------------
# If you are a Confluent customer, then you should replace the default
# value with your actual Confluent customer ID.  Doing so will ensure
# that additional support metrics will be co0llected and reported.
#
confluent.support.customer.id=anonymous" >> /etc/kafka/server.properties

