#
# Oracle Java 8 Dockerfile
#

FROM ubuntu:16.04

MAINTAINER zhulinpinyu "lixiangmu@gmail.com"

ENV REFRESHED_AT 2016-06-30

RUN apt-get -y update
RUN apt-get install -y software-properties-common --fix-missing --no-install-recommends

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer --fix-missing --no-install-recommends && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]
