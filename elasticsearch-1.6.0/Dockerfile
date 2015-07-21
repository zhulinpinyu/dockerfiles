#
# Elasticsearch Dockerfile
#

FROM java:8-jre

MAINTAINER zhulinpinyu "lixiangmu@gmail.com"

ENV REFRESHED_AT 2015-07-21

# Define variable name
ENV ES_PKG_NAME elasticsearch-1.6.0

#Install ES

RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar zxvf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz

VOLUME ["/data","/logs"]

# ADD config file elasticsearch.yml
ADD config/elasticsearch.yml /$ES_PKG_NAME/config/elasticsearch.yml

WORKDIR /$ES_PKG_NAME

RUN bin/plugin -i elasticsearch/marvel/latest

EXPOSE 9200
EXPOSE 9300

# Default command
CMD ["bin/elasticsearch"]