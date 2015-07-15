
Build Elasticsearch Docker image with Marvel
===


	```
  	docker build -t elasticsearch:marvel .
	```

##Usage

###Basic

eg. use elasticsearch image create container

    docker run -d -p 9200:9200 -p 9300:9300 elasticsearch:marvel


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
    docker run -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/usr/share/elasticsearch elasticsearch:marvel /usr/share/elasticsearch/bin/elasticsearch
    ```
4. open `http://host:9200` to visit
