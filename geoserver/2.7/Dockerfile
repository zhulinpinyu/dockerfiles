FROM tomcat:8.0
MAINTAINER Tim Sutton<tim@linfiniti.com>

RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive
RUN  dpkg-divert --local --rename --add /sbin/initctl

# Use local cached debs from host (saves your bandwidth!)
# Change ip below to that of your apt-cacher-ng host
# Or comment this line out if you do not with to use caching
# ADD 71-apt-cacher-ng /etc/apt/apt.conf.d/71-apt-cacher-ng

RUN apt-get -y update

#-------------Application Specific Stuff ----------------------------------------------------

RUN apt-get -y install unzip openjdk-7-jre-headless openjdk-7-jre

ADD resources /tmp/resources

# A little logic that will fetch the geoserver zip file if it
# is not available locally in the resources dir and

# RUN unzip /tmp/resources/geoserver-2.7.0-bin.zip -d /opt && mv -v /opt/geoserver* /opt/geoserver
RUN mv /tmp/resources/geoserver-2.7.0 /opt/geoserver
RUN unzip /tmp/resources/geoserver-2.7.0-wps-plugin.zip -d /opt/geoserver-2.7.0-wps-plugin && mv /opt/geoserver-2.7.0-wps-plugin/* /opt/geoserver/webapps/geoserver/WEB-INF/lib
ENV GEOSERVER_HOME /opt/geoserver
ENV JAVA_HOME /usr/

#ENTRYPOINT "/opt/geoserver/bin/startup.sh"
CMD "/opt/geoserver/bin/startup.sh"
EXPOSE 8080