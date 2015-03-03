
Build Elasticsearch Docker image
===

##Installation


1. Install [Docker](http://www.docker.com)
2. Get [elasticsearch Dockerfile](https://github.com/zhulinpinyu/dockerfiles/blob/master/elasticsearch/Dockerfile)
3. create self-define [config file](https://github.com/zhulinpinyu/dockerfiles/blob/master/elasticsearch/config/elasticsearch.yml) `config/elasticsearch.yml` 
4. build image use [Dockerfile](https://github.com/zhulinpinyu/dockerfiles/blob/master/elasticsearch/Dockerfile)

	```
  	docker build -t zhulinpinyu/elasticsearch
	```

##Usage

###Basic

eg. use elasticsearch image create container

    docker run -d -p 9200:9200 -p 9300:9300 zhulinpinyu/elasticsearch


###Attach persistent/shared directories

1. create folder `<data-dir>` on host
2. create elasticsearch config file at `<data-dir>/elasticsearch.yml`
    
    ```
    path:
      logs: /data/log
      data: /data/data
    ```

3. create container by mount volume and specify elasticsearch config file

    ```
    docker run -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data zhulinpinyu/elasticsearch /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml
    ```
4. open `http://host:9200` to visit
