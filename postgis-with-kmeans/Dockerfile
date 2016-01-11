FROM mdillon/postgis:9.4
RUN apt-get update \
      && apt-get install -y wget unzip make gcc postgresql-server-dev-9.4 \
      && wget http://api.pgxn.org/dist/kmeans/1.1.0/kmeans-1.1.0.zip \
      && unzip kmeans-1.1.0.zip \
      && rm kmeans-1.1.0.zip \
      && cd kmeans-1.1.0 \
      && export USE_PGXS=1 \
      && make \
      && make install