FROM zhulinpinyu/tomcat:7.0-oracle-jdk8

COPY ./resources/fonts/*.ttf /usr/lib/jvm/java-8-oracle/jre/lib/fonts/

#Optimze Java Memory
COPY setenv.sh /opt/tomcat/bin/

#enable CORS
COPY web.xml /opt/tomcat/conf/

#encoding use utf-8
COPY server.xml /opt/tomcat/conf/

#deploy geoserver
ADD ./resources/geoserver-2.9.0-war/geoserver /opt/tomcat/webapps/geoserver