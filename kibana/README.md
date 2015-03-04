
Build Kibana docker image
===

##Docker Kibana

1. Get [Dockerfile](https://github.com/zhulinpinyu/dockerfiles/blob/master/kibana/Dockerfile)
2. Create [run.sh](https://github.com/zhulinpinyu/dockerfiles/blob/master/kibana/run.sh) in current directory

        #!/bin/sh
        set -e
        KIBANA_ES_URL=${KIBANA_ES_URL:-http://localhost:9200}
        KIBANA_INDEX=${KIBANA_INDEX:-kibana-init}
        
        sed -i "s;^elasticsearch_url:.*;elasticsearch_url: ${KIBANA_ES_URL};" "/kibana/config/kibana.yml"
        sed -i "s;^kibana_index:.*;kibana_index: ${KIBANA_INDEX};" "/kibana/config/kibana.yml"
        
        unset HOST
        unset PORT
        
        exec /kibana/bin/kibana


    Tips:
    > Define startup variable `KIBANA_ES_URL`and`KIBANA_INDEX`    
    Default `KIBANA_ES_URL`'s value is `http://localhost:9200`    
    Default `KIBANA_INDEX`'s value is `kibana-init`

3. Build kibana image

        docker build -t zhulinpinyu/kibana .
    

##Usage
###Basic
eg. create by default config
    
    docker run --name kibana -d -p 5601:5601 zhulinpinyu/kibana
    
###Specify `KIBANA_ES_URL`

    docker run --name kibana -d -p 5601:5601 -e KIBANA_ES_URL=http://example.com:port zhulinpinyu/kibana


##Challenge

script file `run.sh` is sensitive to space

**`Error in run.sh`**

    KIBANA_ES_URL = ${KIBANA_ES_URL:-http://localhost:9200}
    
**`Right in run.sh`**

    KIBANA_ES_URL=${KIBANA_ES_URL:-http://localhost:9200}
