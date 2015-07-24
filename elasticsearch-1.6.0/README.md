
Build Elasticsearch Docker image with Marvel
===
  
  elasticsearch version 1.6

    docker build -t elasticsearch:1.6 .

##Usage

###Basic

eg. use elasticsearch image create container and set cluster/node name

    docker run -d -p 9200:9200 -p 9300:9300 zhulinpinyu/elasticsearch:1.6 /elasticsearch-1.6.0/bin/elasticsearch -Des.cluster.name="c1" -Des.node.name="n1"


###Attach persistent/shared directories

1. create container by mount volume and specify elasticsearch config file

    ```
    docker run --name es -d -p 9200:9200 -p 9300:9300 -v "$PWD/logs":/logs -v "$PWD/data":/data zhulinpinyu/elasticsearch:1.6 /elasticsearch-1.6.0/bin/elasticsearch -Des.cluster.name="c1" -Des.node.name="n1"
    ```
2. open `http://host:9200` to visit
