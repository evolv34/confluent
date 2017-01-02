FROM java:8

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y python3-software-properties
RUN wget -qO - http://packages.confluent.io/deb/3.1/archive.key | apt-key add -
RUN add-apt-repository "deb [arch=amd64] http://packages.confluent.io/deb/3.1 stable main"
RUN apt-get update && apt-get install -y confluent-platform-oss-2.11

COPY run.sh .
RUN chmod +x run.sh

COPY server.sh .
RUN chmod +x server.sh

CMD ["/run.sh"]
EXPOSE 2181 9092





