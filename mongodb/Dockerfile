# Dockerizing MongoDB: Dockerfile for building MongoDB images
# Based on ubuntu:latest, installs MongoDB following the instructions from:
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

FROM       ubuntu:14.04.1
MAINTAINER zhulinpinyu

# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Update apt-get sources AND install MongoDB
RUN apt-get update && apt-get install -y mongodb-org

# Create the MongoDB data directory
VOLUME ["/var/opt/data/mongodb","/var/opt/log/mongodb"]

# Expose port #27017 from the container to the host
EXPOSE 27017

CMD ["/usr/bin/mongod","--dbpath=/var/opt/data/mongodb","--logpath=/var/opt/log/mongodb/mongodb.log"]
