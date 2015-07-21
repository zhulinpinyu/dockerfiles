
Build Elasticsearch Docker image with Marvel
===
  
  elasticsearch version 1.6

	```
  	docker build -t elasticsearch:marvel .
	```

##Usage

###Basic

eg. use elasticsearch image create container

    docker run -d -p 9200:9200 -p 9300:9300 elasticsearch:marvel


###Attach persistent/shared directories

1. create container by mount volume and specify elasticsearch config file

    ```
    docker run --name es -d -p 9200:9200 -p 9300:9300 -v "$PWD/config":/usr/share/elasticsearch/config -v "$PWD/data":/usr/share/elasticsearch/data elasticsearch:marvel /usr/share/elasticsearch/bin/elasticsearch
    ```
2. open `http://host:9200` to visit
