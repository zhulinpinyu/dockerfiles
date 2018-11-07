FROM ubuntu:14.04.1

MAINTAINER zhulinpinyu "lixiangmu@gmail.com"

ENV REFRESHED_AT 2015-03-03

# Define variable name
ENV KIBANA_VERSION kibana-4.0.0-linux-x64

RUN apt-get install -y wget && \
  wget https://download.elasticsearch.org/kibana/kibana/$KIBANA_VERSION.tar.gz && \
  tar zxvf $KIBANA_VERSION.tar.gz && \
  rm -f $KIBANA_VERSION.tar.gz && \
  mv /$KIBANA_VERSION /kibana

ADD ./run.sh /kibana/run.sh
RUN chmod +x /kibana/run.sh

EXPOSE 5601

ENTRYPOINT ["/kibana/run.sh"]