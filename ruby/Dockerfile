FROM ubuntu:14.04.1

RUN apt-get update && apt-get install -y \
  build-essential \
  git-core \
  libcurl4-openssl-dev \
  libffi-dev \
  libpq-dev \
  libreadline-dev \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  libyaml-dev \
  wget \
  zlib1g-dev

WORKDIR /

RUN wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz && \
  tar -xzvf ruby-2.2.0.tar.gz

WORKDIR /ruby-2.2.0

RUN ./configure --disable-install-doc \
&& make && make install

RUN gem install rubygems-update --no-ri --no-rdoc && \
  update_rubygems && \
  gem install bundler --no-ri --no-rdoc

RUN apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -fr /ruby-2.2.0 && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN ln -s /usr/local/bin/ruby /usr/bin/ruby