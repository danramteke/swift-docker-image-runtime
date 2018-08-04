FROM ibmcom/swift-ubuntu-xenial-runtime:latest

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
  build-essential \
  clang-3.8 \
  dirmngr \
  gnupg2 \
  libatomic1 \
  libbsd-dev \
  libcurl4-openssl-dev \
  libicu-dev \
  libicu55 \
  libsqlite3-dev \
  libxml2 \
  pkg-config \
  tzdata \
  zlib1g-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
