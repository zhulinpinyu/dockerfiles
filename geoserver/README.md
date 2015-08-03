GeoServer v2.7.0
===

###Run

    docker pull zhulinpinyu/geoserver:2.7.0

###Usage

    sudo docker run --name "geoserver"  --link postgis:postgis -p 8080:8080 -d -t zhulinpinyu/geoserver:2.7.0

---
    #save styles and workspaces in host
    
    sudo docker run --name "geoserver" -v "$HOME/data_dir/styles":/opt/geoserver/data_dir/styles -v "$HOME/data_dir/workspaces":/opt/geoserver/data_dir/workspaces --link pg:postgis -p 8080:8080 -d -t zhulinpinyu/geoserver:2.7.0

> make log error `sudo docker run --name "geoserver" -v "$PWD/data":/opt/geoserver/data_dir --link postgis:postgis -p 8080:8080 -d -t zhulinpinyu/geoserver:2.7.0`

