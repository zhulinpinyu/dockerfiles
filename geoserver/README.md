GeoServer v2.7.0
===

###Run

    docker pull zhulinpinyu/geoserver:2.7.0

###Usage

    sudo docker run --name "geoserver"  --link postgis:postgis -p 8080:8080 -d -t zhulinpinyu/geoserver:2.7.0

---
    【Need 重新Test】
    sudo docker run --name "geoserver" -v "$PWD/data":/opt/geoserver/data_dir --link postgis:postgis -p 8080:8080 -d -t zhulinpinyu/geoserver:2.7.0