GeoServer v2.9.0
===

###Run

    docker build -t zhulinpinyu/geoserver:2.9 .

###Usage

    sudo docker run --name "geoserver" -p 8080:8080 -d -t zhulinpinyu/geoserver:2.9

---
    #use data
    docker run -it -d --name "geoserver" -p 8888:8080 -v ${PWD}/geoserver/data:/opt/tomcat/webapps/geoserver/data zhulinpinyu/geoserver:2.9


### Config CORS for GeoServer

  http://tomcat.apache.org/tomcat-7.0-doc/config/filter.html#CORS_Filter

  Folder  /var/lib/tomcat7/conf/web.xml